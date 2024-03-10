class Connection < ActiveRecord::Base
  belongs_to :flight, inverse_of: :connections
end
