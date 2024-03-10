class Link < ActiveRecord::Base
  belongs_to :linkable, polymorphic: true, inverse_of: :links, validate: true

  validates :link_type, presence: true
  validates :url, presence: true
end
