require_relative 'base_importer'
require_relative '../models/rental_car'

class RentalCarsImporter < BaseImporter
  IMPORT_ATTTRBUTES = %w[company car_make_model price pickup_location_airport_id pickup_datetime dropoff_location_airport_id dropoff_datetime].freeze

  def self.import_attributes
    IMPORT_ATTTRBUTES
  end

  def self.model
    RentalCar
  end
end
