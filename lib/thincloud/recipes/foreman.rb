after "deploy:create_symlink", "foreman:export"

namespace :foreman do

  desc "Export the Procfile to Ubuntu's upstart scripts"
  task :export, roles: :app do
    run "cd #{release_path} && sudo /usr/local/rvm/bin/rvm default exec " <<
        "bundle exec foreman export upstart /etc/init " <<
        "-a #{application}-#{rails_env} -u #{user} -l #{shared_path}/log"
  end

  desc "Start the application services"
  task :start, roles: :app do
    sudo "/sbin/start #{application}-#{rails_env}"
  end

  desc "Stop the application services"
  task :stop, roles: :app do
    sudo "/sbin/stop #{application}-#{rails_env}"
  end

  desc "Restart the application services"
  task :restart, roles: :app do
    run "sudo /sbin/start #{application}-#{rails_env} || " <<
        "sudo /sbin/restart #{application}-#{rails_env}"
  end

end
