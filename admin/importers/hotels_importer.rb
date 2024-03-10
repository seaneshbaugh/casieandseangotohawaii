require_relative 'base_importer'
require_relative '../models/hotel'

class HotelsImporter < BaseImporter
  IMPORT_ATTTRBUTES = %w[name address phone notes frommers_guide_book_page].freeze

  def self.import_attributes
    IMPORT_ATTTRBUTES
  end

  def self.model
    Hotel
  end
end
