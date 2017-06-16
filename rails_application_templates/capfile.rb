
def capfile(config)
  if config.installed?
    done "Cap files '#{config.files}' exists, not running `cap install`"
  else
    sys_exec! 'cap install'
  end

  ruby = :ruby
  create_initial_file(
    source: config.source_dir_for.dest_files_that_exist.join(
      ruby.to_s, config.capfile
    ),

    dest: config.capfile,
    comment: :ruby,
    key_string: config.key_string
  )
end
