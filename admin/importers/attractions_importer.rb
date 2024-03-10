require_relative 'base_importer'
require_relative '../models/attraction'

class AttractionsImporter < BaseImporter
  IMPORT_ATTTRBUTES = %w[name attraction_type priority address phone hours notes notes_danger frommers_guide_book_page].freeze

  def self.import_attributes
    IMPORT_ATTTRBUTES
  end

  def self.model
    Attraction
  end
end
