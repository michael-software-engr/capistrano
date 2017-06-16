
require 'pathname'

class CapistranoConfig
  TOP_SOURCE_DIR = Pathname.new(File.dirname(__FILE__)).freeze
  private_constant :TOP_SOURCE_DIR

  attr_reader :capfile, :file, :source_dir_for, :files, :key_string

  def initialize(config_dir)
    @capfile = 'Capfile'.freeze

    @file = file_struct_build config_dir
    @source_dir_for = source_dir_for_struct_build

    @files = ([@capfile] + file.members.map do |mem|
      file.public_send(mem).to_s
    end).freeze

    @installed = cap_installed?
    @key_string = '... edited by app gen (Capistrano)'.freeze
  end

  def installed?
    @installed
  end

  private

  def file_struct_build(config_dir)
    Struct.new(
      :deploy, :staging, :production
    ).new(
      config_dir.join('deploy.rb'),
      config_dir.join('deploy', 'staging.rb'),
      config_dir.join('deploy', 'production.rb')
    ).freeze
  end

  def source_dir_for_struct_build
    Struct.new(
      :non_existent_dest_files,
      :dest_files_that_exist,
      :templates
    ).new(
      TOP_SOURCE_DIR.join('dest_file_does_not_exist'),
      TOP_SOURCE_DIR.join('dest_file_exists'),
      TOP_SOURCE_DIR.join('templates')
    ).freeze
  end

  def cap_installed?
    files.all? { |file| File.exist? file }
  end
end
