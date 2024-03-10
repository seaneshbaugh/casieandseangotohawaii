require_relative 'base_importer'
require_relative '../models/person'

class PeopleImporter < BaseImporter
  IMPORT_ATTTRBUTES = %w[name].freeze

  def self.import_attributes
    IMPORT_ATTTRBUTES
  end

  def self.model
    Person
  end
end
