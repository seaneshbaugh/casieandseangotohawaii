require_relative 'base_serializer'
require_relative '../models/leg'

class LegSerializer < BaseSerializer
  def end_date
    @leg.end_date.strftime('%Y-%m-%d')
  end

  def start_date
    @leg.start_date.strftime('%Y-%m-%d')
  end
end
