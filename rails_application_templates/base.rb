
require_relative '../../../config/rails_dir'

require_relative 'config'
require_relative 'install'
require_relative 'rake_tasks'
require_relative 'capfile'
require_relative 'deployment_files'

require_relative 'setup_task'
require_relative 'deploy_task'

def setup_capistrano(puma_config, remote_app_base_dir, git_remote_name)
  subtitle 'Capistrano'
  capistrano_config = CapistranoConfig.new RailsDir::CONFIG

  install

  copy_rake_tasks capistrano_config
  capfile capistrano_config
  deployment_files capistrano_config

  setup_setup_task capistrano_config, puma_config

  setup_deploy_task(
    capistrano_config, puma_config.name, remote_app_base_dir, git_remote_name
  )
end
