require 'active_support/all'
require_relative '../admin'
require_relative '../commands/migrate'
require_relative '../commands/import'

module Admin
  module Commands
    class ResetDB
      def self.run!
        new.resetdb!
      end

      def initialize
        @exit_code = 0
      end

      def resetdb!
        File.delete(Admin.database_path)

        Migrate.run!

        Import.run!

        @exit_code
      end
    end
  end
end
