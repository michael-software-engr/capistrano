
def copy_rake_tasks(config)
  ruby = :ruby

  recursively_create_initial_files(
    source_dir: config.source_dir_for.non_existent_dest_files.join(ruby.to_s),
    root_of_common_path: 'lib',
    options: {
      comment: ruby,
      key_string: config.key_string,
      dest_file_must_exist: false
    }
  )
end
