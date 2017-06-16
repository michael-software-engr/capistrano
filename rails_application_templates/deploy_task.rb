
def setup_deploy_task(
  capistrano_config, puma_name, remote_app_base_dir, git_remote_name
)
  resolve_template(
    value_for: {
      git_remote_name: git_remote_name,
      puma_name: puma_name,
      remote_app_base_dir: remote_app_base_dir,
      remote_git_base_dir: ENV.fetch('_remote_git_base_dir_')
    },
    source_dir: capistrano_config.source_dir_for.templates,
    common_path: RailsDir::CAPISTRANO_TASKS.join('deploy.rake'),
    key_string: capistrano_config.key_string,
    dest_file_must_exist: false
  )
end
