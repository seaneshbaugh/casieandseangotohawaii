require 'yaml'
require 'active_record'
require 'active_support/all'
require_relative '../admin'
require_relative '../importers/trips_importer'
require_relative '../importers/people_importer'
require_relative '../importers/hotels_importer'
require_relative '../importers/airports_importer'
require_relative '../importers/rental_cars_importer'
require_relative '../importers/legs_importer'
require_relative '../importers/stays_importer'
require_relative '../importers/days_importer'
require_relative '../importers/links_importer'
require_relative '../importers/flights_importer'
require_relative '../importers/connections_importer'
require_relative '../importers/attractions_importer'
require_relative '../importers/visits_importer'
require_relative '../importers/visitors_importer'
require_relative '../importers/restaurants_importer'
require_relative '../importers/meals_importer'
require_relative '../importers/orders_importer'
require_relative '../importers/ratings_importer'
require_relative '../importers/events_importer'
require_relative '../importers/pictures_importer'

module Admin
  module Commands
    class Import
      def self.run!
        new.import!
      end

      def initialize
        ActiveRecord::Base.logger = Logger.new($stdout)

        ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: Admin.database_path)

        @exit_code = 0
      end

      def import!
        importer_classes.each do |importer_class|
          importer = importer_class.new(File.join(Admin.data_directory, "#{importer_class.name.split('Importer').first.tableize}.yml"))

          importer.import!
        end

        @exit_code
      end

      private

      def importer_classes
        # This order matters.
        [
          TripsImporter,
          PeopleImporter,
          HotelsImporter,
          AirportsImporter,
          RentalCarsImporter,
          LegsImporter,
          StaysImporter,
          DaysImporter,
          LinksImporter,
          FlightsImporter,
          ConnectionsImporter,
          AttractionsImporter,
          VisitsImporter,
          VisitorsImporter,
          RestaurantsImporter,
          MealsImporter,
          OrdersImporter,
          RatingsImporter,
          EventsImporter,
          PicturesImporter
        ]
      end
    end
  end
end
