
def setup_setup_task(capistrano_config, puma_config)
  resolve_template(
    value_for: {
      puma_name: puma_config.name,
      puma_nginx_conf: puma_config.nginx_conf,
      puma_init_sh: puma_config.init_sh
    },
    source_dir: capistrano_config.source_dir_for.templates,
    common_path: RailsDir::CAPISTRANO_TASKS.join('setup.rake'),
    key_string: capistrano_config.key_string,
    dest_file_must_exist: false
  )
end
