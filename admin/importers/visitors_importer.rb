require_relative 'base_importer'
require_relative '../models/visitor'

class VisitorsImporter < BaseImporter
  IMPORT_ATTTRBUTES = %w[visit_id person_id].freeze

  def self.import_attributes
    IMPORT_ATTTRBUTES
  end

  def self.model
    Visitor
  end
end
