require_relative 'base_importer'
require_relative '../models/airport'

class AirportsImporter < BaseImporter
  IMPORT_ATTTRBUTES = %w[name code address phone frommers_guide_book_page].freeze

  def self.import_attributes
    IMPORT_ATTTRBUTES
  end

  def self.model
    Airport
  end
end
