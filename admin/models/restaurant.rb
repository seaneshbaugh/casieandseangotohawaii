class Restaurant < ActiveRecord::Base
  VALID_PRIORITIES = %w[minor low normal high major omg optional].freeze

  has_many :meals, inverse_of: :restaurant

  validates :priority, inclusion: { in: VALID_PRIORITIES, message: '%<value> is not a valid priority' }
end
