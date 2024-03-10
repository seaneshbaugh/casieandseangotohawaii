require_relative 'base_importer'
require_relative '../models/event'

class EventsImporter < BaseImporter
  IMPORT_ATTTRBUTES = %w[leg_id day_id eventable_id eventable_type order].freeze

  def self.import_attributes
    IMPORT_ATTTRBUTES
  end

  def self.model
    Event
  end
end
