# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

# activate :autoprefixer do |prefix|
#   prefix.browsers = "last 2 versions"
# end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

trip_names = {
  '2017' => 1,
  '2021' => 2
}

trip_names.each do |trip_name, trip_id|
  proxy(
    "/#{trip_name}.html",
    '/show.html',
    data: {
      trip_name: trip_name,
      trip_id: trip_id
    },
    ignore: true
  )
end

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do
  def airport(airport_id)
    data.airports.select { |airport| airport.id == airport_id }.first
  end

  def attraction(attraction_id)
    data.attractions.select { |attraction| attraction.id == attraction_id }.first
  end

  def connections(flight_id)
    data.connections.select { |connection| connection.flight_id == flight_id }
  end

  def days(trip_id, leg_id)
    data.days.select { |day| day.trip_id == trip_id && day.leg_id == leg_id }
  end

  def eventable(eventable_type, eventable_id)
    # This makes the assumption that all the eventable data types are pluralized by just
    # adding an 's'. So far that's true.
    data.send("#{eventable_type}s").select { |eventable| eventable.id == eventable_id }.first
  end

  def events(leg_id, day_id)
    data.events.select { |event| event.leg_id == leg_id && event.day_id == day_id }.sort_by { |event| event.order }
  end

  def hotel(hotel_id)
    data.hotels.select { |hotel| hotel.id == hotel_id }.first
  end

  def legs(trip_id)
    data.legs.select { |leg| leg.trip_id == trip_id }
  end

  def links(linkable_type, linkable_id)
    data.links.select { |link| link.linkable_type == linkable_type && link.linkable_id == linkable_id }
  end

  def meal(meal_id)
    data.meal.select { |meal| meal.id == meal_id }.first
  end

  def orders(meal_id)
    data.orders.select { |order| order.meal_id == meal_id }
  end

  def orders_grouped_by_person_name(meal_id)
    orders(meal_id).group_by do |order|
      person = person(order.person_id)

      if person.nil? && !order.person_id.nil?
        raise "Person with id #{order.person_id} not found. If you want to indicate a shared order leave person_id as nil."
      end

      if person
        person.name
      else
        'Shared'
      end
    end
  end

  def past_trips
    data.trips.sort { |a, b| Date.strptime(a.start_date, '%Y-%m-%d') <=> Date.strptime(b.start_date, '%Y-%m-%d') }[1..-1]
  end

  def person(person_id)
    data.people.select { |person| person.id == person_id }.first
  end

  def pictures(event_id)
    data.pictures.select { |picture| picture.event_id == event_id }
  end

  def ratings(meal_id)
    data.ratings.select { |rating| rating.meal_id == meal_id }
  end

  def rental_car(rental_car_id)
    data.rental_cars.select { |rental_car| rental_car.id == rental_car_id }.first
  end

  def restaurant(restaurant_id)
    data.restaurants.select { |restaurant| restaurant.id == restaurant_id }.first
  end

  def stay(trip_id, leg_id, hotel_id)
    data.stays.select { |stay| stay.trip_id == trip_id && stay.leg_id == leg_id && stay.hotel_id == hotel_id }.first
  end

  def trips
    data.trips
  end

  def trips_reverse_chronological
    data.trips.sort { |a, b| Date.strptime(b.start_date, '%Y-%m-%d') <=> Date.strptime(a.start_date, '%Y-%m-%d') }
  end

  def trip(trip_id)
    data.trips.select { |trip| trip.id == trip_id }.first
  end

  def visits
    data.visits
  end

  def visit(visit_id)
    data.visits.select { |visit| visit.id == visit_id }.first
  end

  def visit_people(visit_id)
    people_ids = data.visitors.select { |visitor| visitor.visit_id == visit_id }.map { |visitor| visitor.person_id }

    data.people.select { |person| people_ids.include?(person.id) }
  end
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end

configure :development do
  activate :livereload, host: '0.0.0.0', port: '35729'
end

activate :external_pipeline,
  name: :webpack,
  command: build? ?
  './node_modules/webpack/bin/webpack.js --bail --mode=production' :
  './node_modules/webpack/bin/webpack.js --watch --progress --color --mode=development --stats-children --stats-error-details',
  source: 'dist',
  latency: 1,
  ignore_exit_code: true,
  manifest_json: 'dist/assets-manifest.json'

set :haml, { attr_wrapper: '"' }

files.watch(
  :source,
  path: File.join(__dir__, 'source')
)
