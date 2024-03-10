require 'active_record'
require 'active_support/all'
require_relative '../admin'
require_relative '../serializers/airport_serializer'
require_relative '../serializers/attraction_serializer'
require_relative '../serializers/connection_serializer'
require_relative '../serializers/day_serializer'
require_relative '../serializers/event_serializer'
require_relative '../serializers/flight_serializer'
require_relative '../serializers/hotel_serializer'
require_relative '../serializers/leg_serializer'
require_relative '../serializers/link_serializer'
require_relative '../serializers/meal_serializer'
require_relative '../serializers/order_serializer'
require_relative '../serializers/person_serializer'
require_relative '../serializers/picture_serializer'
require_relative '../serializers/rating_serializer'
require_relative '../serializers/rental_car_serializer'
require_relative '../serializers/restaurant_serializer'
require_relative '../serializers/stay_serializer'
require_relative '../serializers/trip_serializer'
require_relative '../serializers/visit_serializer'
require_relative '../serializers/visitor_serializer'

module Admin
  module Commands
    class Export
      def self.run!
        new.export!
      end

      def initialize
        ActiveRecord::Base.logger = Logger.new($stdout)

        ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: Admin.database_path)

        @exit_code = 0
      end

      def export!
        export_models.each do |model|
          File.open(File.join(Admin.export_path, "#{model.name.tableize}.yml"), 'w+') do |export_file|
            export_file.puts model.all.map { |object| "#{model.name}Serializer".constantize.new(object).to_yaml }.join("\n")
          end
        end

        @exit_code
      end

      private

      # TODO: Make this a command line option.
      def export_models
        [
          Airport,
          Attraction,
          Connection,
          Day,
          Event,
          Flight,
          Hotel,
          Leg,
          Link,
          Meal,
          Order,
          Person,
          Picture,
          Rating,
          RentalCar,
          Restaurant,
          Stay,
          Trip,
          Visit,
          Visitor
        ]
      end
    end
  end
end
