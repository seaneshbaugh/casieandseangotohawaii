require_relative 'base_importer'
require_relative '../models/connection'

class ConnectionsImporter < BaseImporter
  IMPORT_ATTTRBUTES = %w[flight_id flight_number connection_airport_id connection_arrival_time connection_departure_time connection_layover_duration connection_duration].freeze

  def self.import_attributes
    IMPORT_ATTTRBUTES
  end

  def self.model
    Connection
  end
end
