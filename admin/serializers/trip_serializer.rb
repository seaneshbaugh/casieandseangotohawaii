require_relative 'base_serializer'
require_relative '../models/trip'

class TripSerializer < BaseSerializer
  def end_date
    @trip.end_date.strftime('%Y-%m-%d')
  end

  def start_date
    @trip.start_date.strftime('%Y-%m-%d')
  end
end
