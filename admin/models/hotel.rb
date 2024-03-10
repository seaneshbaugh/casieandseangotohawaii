class Hotel < ActiveRecord::Base
  has_many :legs, inverse_of: :hotel
  has_many :stays, inverse_of: :hotel

  validates :name, presence: true
  validates :address, presence: { allow_nil: true }
  validates :phone, presence: { allow_nil: true }
  validates :frommers_guide_book_page, format: { with: /\d{1,3}\z/, message: 'must be a valid page number', allow_nil: true }
  validates :notes, presence: { allow_nil: true }
end
