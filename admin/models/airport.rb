class Airport < ActiveRecord::Base
  has_many :pickup_rental_cars, class_name: 'RentalCar', foreign_key: 'rental_car_id', inverse_of: :pickup_location_airport, validate: true
  has_many :dropoff_rental_cars, class_name: 'RentalCar', foreign_key: 'rental_car_id', inverse_of: :dropoff_location_airport, validate: true

  validates :name, presence: true
  validates :code, presence: true
  validates :address, presence: true
end
