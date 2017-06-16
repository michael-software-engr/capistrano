
server(
  ENV.fetch('_production_server_'),
  roles: %w[app web db],
  port: ENV.fetch('_sshport_'),
  primary: true
)

set :deploy_to, File.join(
  ENV.fetch('_remote_app_base_dir_'), fetch(:application)
)