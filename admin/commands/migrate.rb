require 'active_record'
require 'active_record/schema_dumper'
require 'active_support/all'
require_relative '../admin'

module Admin
  module Commands
    class Migrate
      def self.run!
        new.migrate!
      end

      def initialize
        ActiveRecord::Base.logger = Logger.new($stdout)

        ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: Admin.database_path)

        ActiveRecord::MigrationContext.new([Admin.migrations_directory], ActiveRecord::Base.connection.schema_migration).migrate

        @exit_code = 0
      end

      def migrate!
        File.open(Admin.schema_path, 'w:utf-8') do |schema_file|
          ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, schema_file)
        end

        @exit_code
      end
    end
  end
end
