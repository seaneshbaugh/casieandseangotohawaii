require_relative 'base_importer'
require_relative '../models/trip'

class TripsImporter < BaseImporter
  IMPORT_ATTTRBUTES = %w[name slug start_date end_date].freeze

  def self.import_attributes
    IMPORT_ATTTRBUTES
  end

  def self.model
    Trip
  end
end
