require 'securerandom'

module Helpdesk
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Creates a Helpdesk initializer and copy locale files to your application."

      def copy_initializer
        template "helpdesk.rb", "config/initializers/helpdesk.rb"
      end

      def copy_locale
        copy_file "../../../../config/locales/helpdesk.en.yml", "config/locales/helpdesk.en.yml"
        copy_file "../../../../config/locales/helpdesk.pl.yml", "config/locales/helpdesk.pl.yml"
      end

      def run_rake
        rake "helpdesk:install:migrations"
        rake "db:migrate"
      end

      def add_engine_to_route
        route "mount Helpdesk::Engine, :at => '/helpdesk'"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end


    end
  end
end
