class Trip < ActiveRecord::Base
  has_many :legs, inverse_of: :trip
  has_many :days, inverse_of: :trip
  has_many :stays, inverse_of: :trip

  validates :name, format: { with: /2\d\d\d\z/, message: 'must be a year in the third millennium' }, length: { is: 4 }, presence: true, uniqueness: true
  validates :slug, format: { with: /(\A\z|\A2\d\d\d\z)/, allow_nil: false, message: 'must either be an empty string or a year in the third millennium' }, uniqueness: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
