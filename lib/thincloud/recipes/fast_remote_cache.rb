require "capistrano/fast_remote_cache"

set :deploy_via, :fast_remote_cache
set :local_cache, "tmp/.rsync_cache"
set :copy_exclude, %w(test spec .git config/database.yml)
