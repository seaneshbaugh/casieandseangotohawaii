require_relative 'base_importer'
require_relative '../models/meal'

class MealsImporter < BaseImporter
  IMPORT_ATTTRBUTES = %w[name restaurant_id notes].freeze

  def self.import_attributes
    IMPORT_ATTTRBUTES
  end

  def self.model
    Meal
  end
end
