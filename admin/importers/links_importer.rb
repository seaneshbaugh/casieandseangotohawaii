require_relative 'base_importer'
require_relative '../models/link'

class LinksImporter < BaseImporter
  IMPORT_ATTTRBUTES = %w[linkable_id linkable_type link_type url].freeze

  def self.import_attributes
    IMPORT_ATTTRBUTES
  end

  def self.model
    Link
  end
end
