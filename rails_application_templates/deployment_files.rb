
def deployment_files(config)
  ruby = :ruby
  recursively_create_initial_files(
    source_dir:
      config.source_dir_for.dest_files_that_exist.join(ruby.to_s),
    root_of_common_path: 'config',
    options: {
      comment: ruby,
      key_string: config.key_string
    }
  )
end
