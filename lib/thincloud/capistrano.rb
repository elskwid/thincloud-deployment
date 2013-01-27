module Capistrano
  if const_defined? :Configuration
    Configuration.instance(true).load do
      recipes = Dir[File.expand_path("../recipes/*.rb", __FILE__)]
      recipes.each { |recipe| load(recipe) }

      ## do other stuff here

      # inject shared_resources
    end
  end
end
