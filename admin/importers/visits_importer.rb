require_relative 'base_importer'
require_relative '../models/visit'

class VisitsImporter < BaseImporter
  IMPORT_ATTTRBUTES = %w[attraction_id notes notes_danger].freeze

  def self.import_attributes
    IMPORT_ATTTRBUTES
  end

  def self.model
    Visit
  end
end
