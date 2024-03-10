class Attraction < ActiveRecord::Base
  VALID_ATTRACTION_TYPES = %w[beach cave garden hike museum park point-of-interest scenic-view store].freeze
  VALID_PRIORITIES = %w[minor low normal high major omg optional].freeze

  validates :name, presence: true
  validates :attraction_type, inclusion: { in: VALID_ATTRACTION_TYPES, message: '%<value> is not a valid attraction type' }, presence: true
  validates :priority, inclusion: { in: VALID_PRIORITIES, message: '%<value> is not a valid priority' }, presence: true
  validates :address, presence: true
end
