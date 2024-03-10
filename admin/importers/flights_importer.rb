require_relative 'base_importer'
require_relative '../models/flight'

class FlightsImporter < BaseImporter
  IMPORT_ATTTRBUTES = %w[flight_number departure_airport_id departure_time duration arrival_airport_id arrival_time total_duration].freeze

  def self.import_attributes
    IMPORT_ATTTRBUTES
  end

  def self.model
    Flight
  end
end
