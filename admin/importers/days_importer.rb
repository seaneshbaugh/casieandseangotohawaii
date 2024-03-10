require_relative 'base_importer'
require_relative '../models/day'

class DaysImporter < BaseImporter
  IMPORT_ATTTRBUTES = %w[trip_id leg_id name date].freeze

  def self.import_attributes
    IMPORT_ATTTRBUTES
  end

  def self.model
    Day
  end
end
