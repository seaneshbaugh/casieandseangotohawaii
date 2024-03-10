require_relative 'base_importer'
require_relative '../models/stay'

class StaysImporter < BaseImporter
  IMPORT_ATTTRBUTES = %w[trip_id leg_id hotel_id price room_type].freeze

  def self.import_attributes
    IMPORT_ATTTRBUTES
  end

  def self.model
    Stay
  end
end
