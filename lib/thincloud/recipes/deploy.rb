# Deploy methods
namespace :deploy do
  desc "Setup our custom shared directories"
  task :setup_shared_directories, roles: :app do
    dirs = fetch(:shared_directories, []).map do |dir|
      "#{shared_path}/#{dir}"
    end.join(" ")

    run "mkdir -p -m 775 #{dirs}"
  end

  desc "Tasks to execute after code update"
  task :link_to_shared, roles: :app do
    link_command = fetch(:shared_resources, []).map do |dirs|
      "rm -rf #{release_path}/#{dirs[:release]}; " <<
      "ln -fs #{shared_path}/#{dirs[:shared]} #{release_path}/#{dirs[:release]}"
    end.join(" && ")

    run link_command
  end
end

after "deploy:setup", "deploy:setup_shared_directories"
after "deploy:update_code", "deploy:link_to_shared"
