
def install
  install_gems %w[
    capistrano
    capistrano-bundler
    capistrano-rails
    capistrano-rails-console
    capistrano-rbenv
  ], groups: [:development], with_header:
    "\n" \
    "\n" \
    '# ... Capistrano...'
end
