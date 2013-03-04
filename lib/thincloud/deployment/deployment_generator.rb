require "thor"

module Thincloud

  # Public: Inherit Thor actions
  class ThorBase < ::Thor::Group
    include ::Thor::Actions
  end

  GeneratorBase = if defined?(Rails)
    require "rails/generators" # Handle Rails load order explicitly
    ::Rails::Generators::Base
  else
    ThorBase
  end


  # Public: Make thincloud:deployment generator available to Rails
  class DeploymentGenerator < GeneratorBase
    source_root File.expand_path("../templates", __FILE__)

    desc "Generates thincloud deployment configuration."
    def deployment
      capify

      copy_stages

      stub_recipes

      setup_foreman

      say_status "", ""
      say_status "success", "thincloud-deployment has finished."
      say_status "", "Edit config/deploy.rb for your application."
    end

    private

    def capify
      copy_file "Capfile", "Capfile"
      empty_directory "config"
      copy_file "deploy.rb", "config/deploy.rb"
    end

    def copy_stages
      empty_directory "config/deploy"
      directory "stages", "config/deploy"
    end

    def stub_recipes
      empty_directory "lib/recipes"
      create_file "lib/recipes/.gitkeep"
    end

    def setup_foreman
      copy_file "foreman", ".foreman"
      copy_file "Procfile", "Procfile"
    end
  end
end
