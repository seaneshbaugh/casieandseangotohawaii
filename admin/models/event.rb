class Event < ActiveRecord::Base
  belongs_to :evantable, polymorphic: true, validate: true
end
