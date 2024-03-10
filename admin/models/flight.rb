class Flight < ActiveRecord::Base
  has_many :connections, inverse_of: :flight
end
