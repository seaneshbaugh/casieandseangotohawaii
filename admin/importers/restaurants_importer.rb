require_relative 'base_importer'
require_relative '../models/restaurant'

class RestaurantsImporter < BaseImporter
  IMPORT_ATTTRBUTES = %w[name priority address phone hours price_range genre notes frommers_guide_book_page].freeze

  def self.import_attributes
    IMPORT_ATTTRBUTES
  end

  def self.model
    Restaurant
  end
end
