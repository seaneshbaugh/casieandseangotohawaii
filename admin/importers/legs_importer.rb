require_relative 'base_importer'
require_relative '../models/leg'

class LegsImporter < BaseImporter
  IMPORT_ATTTRBUTES = %w[trip_id hotel_id rental_car_id leg_type name start_date end_date].freeze

  def self.import_attributes
    IMPORT_ATTTRBUTES
  end

  def self.model
    Leg
  end
end
