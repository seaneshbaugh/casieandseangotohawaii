require_relative 'base_importer'
require_relative '../models/order'

class OrdersImporter < BaseImporter
  IMPORT_ATTTRBUTES = %w[meal_id person_id name].freeze

  def self.import_attributes
    IMPORT_ATTTRBUTES
  end

  def self.model
    Order
  end
end
