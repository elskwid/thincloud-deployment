module Capistrano
  if const_defined? :Configuration
    require "capistrano/ext/multistage"

    set :stages, %w(staging production)
    set :default_stage, "staging"

    # Load recipes into the Capistrano::Configuration instance
    recipes = Dir[File.expand_path("../recipes/*.rb", __FILE__)]
    recipes.each { |recipe|
      puts ">> load #{recipe}"
      Configuration.instance(true).load(recipe)
    }
  end
end
