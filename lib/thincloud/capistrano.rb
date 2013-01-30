module Capistrano
  if const_defined? :Configuration

    Configuration.instance(true).load do
      load "deploy"
      load "deploy/assets"

      require "capistrano/ext/multistage"

      set :stages, %w(staging production)
      set :default_stage, "staging"
    end

    # Load recipes into the Capistrano::Configuration instance
    recipes = Dir[File.expand_path("../recipes/*.rb", __FILE__)]
    puts recipes.inspect
    recipes.each do |recipe|
      Configuration.instance(true).load(recipe)
    end
  end
end
