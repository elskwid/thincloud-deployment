set :branch,     "master"
set (:fqdn)      { "#{stage}.#{domain}" }
set (:rails_env) { stage }

# Number of application servers to run
set :thin_concurrency, 2

# RVM environment
set (:rvm_ruby_string) { "ruby-1.9.3@#{application}" }

# Exclude staging gems
set :bundle_without, [:development, :test, :staging]

# Server roles
server fqdn, :app, :web, :cron, :worker

# Run DB migrations from the :db role
role :db, fqdn, primary: true
