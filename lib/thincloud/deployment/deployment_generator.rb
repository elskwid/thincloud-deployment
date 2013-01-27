require "thor"

module Thincloud
  # module Deployment
    class ThorBase < ::Thor::Group
      include ::Thor::Actions
    end

    GeneratorBase = defined?(Rails) ? ::Rails::Generators::Base : ThorBase

    class DeploymentGenerator < GeneratorBase
      source_root File.expand_path("../templates", __FILE__)

      desc "Generates thincloud deployment configuration."
      def deployment
        capify

        setup_foreman

        copy_stages

        stub_recipes

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

      def setup_foreman
        copy_file "foreman", ".foreman"
        copy_file "Procfile", "Procfile"
      end

      def copy_stages
        empty_directory "config/deploy"
        directory "stages", "config/deploy"
      end

      def stub_recipes
        empty_directory "lib/recipes"
        create_file "lib/recipes/.gitkeep"
      end
    end
  # end
end
