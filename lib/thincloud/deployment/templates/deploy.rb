require "thincloud/capistrano"
require "bundler/capistrano"
require "capistrano/fast_remote_cache"
require "flowdock/capistrano"

set :stages, %w(staging production)
set :default_stage, "staging"
require "capistrano/ext/multistage"

set :domain, "DOMAIN_NAME.com"
set :application, "APPLICATION_NAME"
set :repository,  "git@github.com:ORGANIZATION/APPLICATION_NAME.git"

set :scm, :git
set :git_shallow_clone, 1
set :git_enable_submodules, 1

set :deploy_via, :fast_remote_cache
set :local_cache, "tmp/.rsync_cache"
set :copy_exclude, %w(test spec .git config/database.yml)

set :user, "deploy"
set :use_sudo, false
set (:deploy_to) { "/applications/#{application}/#{stage}" }

set :default_run_options, { pty: true }
set :ssh_options, { forward_agent: true }

# Run this after every successful deployment
set :keep_releases, 5
after "deploy:restart", "deploy:cleanup"

# Shared directories created on setup
set :shared_directories, %w[
  assets attachments backup cache certificates config
  log pids sockets system tmp
]

# Shared resources - symlinked on deployment
set :shared_resources, [
  { shared: "config/database.yml", release: "config/database.yml" },
  { shared: "sockets", release: "tmp/sockets" },
  { shared: "pids", release: "tmp/pids" }
]

# NL Flowdock notifications
set :flowdock_project_name, application
set (:flowdock_deploy_tags) { [application, stage] }
set :flowdock_api_token,    "FLOWDOCK_API_TOKEN"

# restart command
namespace :deploy do
  desc "Restart the application"
  task :restart, roles: :app do
    foreman.restart
  end

  desc "Start the application"
  task :start, roles: :app do
    foreman.start
  end

  desc "Stop the application"
  task :stop, roles: :app do
    foreman.stop
  end
end
