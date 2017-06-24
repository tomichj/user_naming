require 'rails/generators/base'
require 'rails/generators/active_record'
require 'generators/user_naming/helpers'

module UserNaming
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      include UserNaming::Generators::Helpers

      source_root File.expand_path('../templates', __FILE__)
      class_option :model,
                   optional: true,
                   type: :string,
                   banner: 'model',
                   desc: "Specify the model class name if you will use anything other than 'User'"

      def initialize(*)
        super
        assign_names!(model_class_name)
      end

      def verify
        # if options[:model] && !File.exist?(model_path)
        if !File.exist?(model_path)
          puts "Exiting: the model class #{options[:model] || 'User' } is not found. You must have a valid user model."
          exit 1
        end
      end

      def inject_into_user_model
        inject_into_class(model_path, model_class_name, "  include UserNaming::User\n")
      end

      def create_name_migration
        copy_migration 'add_name_to_users.rb'
      end

      private

      # for generating a timestamp when using `create_migration`
      def self.next_migration_number(dir)
        ActiveRecord::Generators::Base.next_migration_number(dir)
      end

    end
  end
end
