class RentalCar < ActiveRecord::Base
  belongs_to :pickup_location_airport, class_name: 'Airport', foreign_key: 'airport_id', inverse_of: :pickup_rental_cars, validate: true
  belongs_to :dropoff_location_airport, class_name: 'Airport', foreign_key: 'airport_id', inverse_of: :dropoff_rental_cars, validate: true

  validates_associated :pickup_location_airport
  validates_associated :dropoff_location_airport

  validates :company, presence: true
  validates :car_make_model, presence: true
  validates :price, presence: true
  validates :pickup_datetime, presence: true
  validates :dropoff_datetime, presence: true
end
