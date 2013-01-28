require "bundler/capistrano"

set :bundle_without do
  [:development, :test].tap do |gem_groups|
    gem_groups += [:staging] if stage == :production
  end
end

