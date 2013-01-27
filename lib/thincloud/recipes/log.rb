# logfile management
namespace :log do
  desc "Tail last ENV['LINES'] of the application logfile"
  task :tail, roles: :app do
    lines = ENV["LINES"] || 50
    stream "tail -n #{lines} #{shared_path}/log/#{rails_env}.log"
  end

  desc "Stream the application logfile"
  task :tail_f, roles: :app do
    lines = ENV["LINES"] || 50
    stream "tail -fn #{lines} #{shared_path}/log/#{rails_env}.log"
  end

  desc "Download the log application file"
  task :scp, roles: :app do
    system "scp #{user}@#{domain}:#{shared_path}/log/#{rails_env}.log log/"
  end
end
