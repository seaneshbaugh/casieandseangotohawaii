class Leg < ActiveRecord::Base
  belongs_to :trip, inverse_of: :legs, validate: true
  belongs_to :hotel, inverse_of: :legs, required: false
  belongs_to :rental_car, inverse_of: :legs, required: false
  has_many :days, inverse_of: :leg, validate: true
  has_one :stay, inverse_of: :leg, required: false, validate: true
end
