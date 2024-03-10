require_relative 'base_serializer'
require_relative '../models/day'

class DaySerializer < BaseSerializer
  def date
    @day.date.strftime('%Y-%m-%d')
  end
end
