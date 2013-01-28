set(:fqdn) { "#{application}-#{stage}.#{domain}" }
set(:rails_env) { stage.to_s }

# Server roles
# server fqdn, :app, :web, :cron, :worker
[:app, :web, :cron, :worker].each do |name|
  role(name) { fqdn }
end

# Run DB migrations from the :db role
role(:db, primary: true) { fqdn }

set :user, "deploy"
set :use_sudo, false
set(:deploy_to) { "/applications/#{application}/#{stage}" }

# SSH
set :default_run_options, { pty: true }
set :ssh_options, { forward_agent: true }

set :keep_releases, 5
after "deploy:restart", "deploy:cleanup"

set :shared_directories do
  %w[
    assets attachments backup cache certificates config log pids
    sockets system tmp
  ]
end

set :shared_resources do
  [
    { shared: "config/database.yml", release: "config/database.yml" },
    { shared: "sockets", release: "tmp/sockets" },
    { shared: "pids", release: "tmp/pids" }
  ]
end


# Deploy methods
namespace :deploy do
  desc "Setup our custom shared directories"
  task :setup_shared_directories, roles: :app do
    dirs = fetch(:shared_directories, []).map do |dir|
      "#{shared_path}/#{dir}"
    end.join(" ")

    run "mkdir -p -m 775 #{dirs}" unless dirs.empty?
  end

  desc "Tasks to execute after code update"
  task :link_to_shared, roles: :app do
    link_command = fetch(:shared_resources, []).map do |dirs|
      "rm -rf #{release_path}/#{dirs[:release]}; " <<
      "ln -fs #{shared_path}/#{dirs[:shared]} #{release_path}/#{dirs[:release]}"
    end.join(" && ")

    run link_command unless link_command.empty?
  end

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

after "deploy:setup", "deploy:setup_shared_directories"
after "deploy:finalize_update", "deploy:link_to_shared"
