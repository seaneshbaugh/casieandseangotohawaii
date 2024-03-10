require_relative 'base_importer'
require_relative '../models/rating'

class RatingsImporter < BaseImporter
  IMPORT_ATTTRBUTES = %w[meal_id person_id rating].freeze

  def self.import_attributes
    IMPORT_ATTTRBUTES
  end

  def self.model
    Rating
  end
end
