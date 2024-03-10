require_relative 'base_importer'
require_relative '../models/picture'

class PicturesImporter < BaseImporter
  IMPORT_ATTTRBUTES = %w[event_id photographer_id filename title description].freeze

  def self.import_attributes
    IMPORT_ATTTRBUTES
  end

  def self.model
    Picture
  end
end
