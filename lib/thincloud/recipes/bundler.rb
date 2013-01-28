require "bundler/capistrano"

set :bundle_without, {
  [:development, :test].tap do |gem_groups|
    gem_groups += [:staging] if stage == :production
  end
}

