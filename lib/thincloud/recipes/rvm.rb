require "rvm/capistrano"

set :rvm_type, :system

# RVM environment
set(:rvm_ruby_string) { "ruby-1.9.3-perf@#{application}" }
