# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_23_173229) do
  create_table "airports", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.string "address", null: false
    t.string "phone"
    t.string "frommers_guide_book_page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attractions", force: :cascade do |t|
    t.string "name", null: false
    t.string "attraction_type", null: false
    t.string "priority", null: false
    t.string "address", null: false
    t.string "phone"
    t.string "hours"
    t.string "notes"
    t.string "notes_danger"
    t.string "frommers_guide_book_page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "connections", force: :cascade do |t|
    t.integer "flight_id", null: false
    t.string "flight_number", null: false
    t.integer "connection_airport_id", null: false
    t.string "connection_arrival_time", null: false
    t.string "connection_departure_time", null: false
    t.string "connection_layover_duration", null: false
    t.string "connection_duration", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["connection_airport_id"], name: "index_connections_on_connection_airport_id"
    t.index ["flight_id"], name: "index_connections_on_flight_id"
  end

  create_table "days", force: :cascade do |t|
    t.integer "trip_id"
    t.integer "leg_id"
    t.string "name"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["leg_id"], name: "index_days_on_leg_id"
    t.index ["trip_id"], name: "index_days_on_trip_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "leg_id"
    t.integer "day_id"
    t.string "eventable_type"
    t.integer "eventable_id"
    t.integer "order", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_events_on_day_id"
    t.index ["eventable_type", "eventable_id"], name: "index_events_on_eventable"
    t.index ["leg_id"], name: "index_events_on_leg_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "flight_number"
    t.integer "departure_airport_id"
    t.string "departure_time"
    t.string "duration"
    t.integer "arrival_airport_id"
    t.string "arrival_time"
    t.string "total_duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arrival_airport_id"], name: "index_flights_on_arrival_airport_id"
    t.index ["departure_airport_id"], name: "index_flights_on_departure_airport_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.string "phone"
    t.string "notes"
    t.string "frommers_guide_book_page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "legs", force: :cascade do |t|
    t.integer "trip_id", null: false
    t.integer "hotel_id"
    t.integer "rental_car_id"
    t.string "leg_type", null: false
    t.string "name", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_legs_on_hotel_id"
    t.index ["rental_car_id"], name: "index_legs_on_rental_car_id"
    t.index ["trip_id"], name: "index_legs_on_trip_id"
  end

  create_table "links", force: :cascade do |t|
    t.string "linkable_type"
    t.integer "linkable_id"
    t.string "link_type"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["linkable_type", "linkable_id"], name: "index_links_on_linkable"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.integer "restaurant_id"
    t.string "notes"
    t.index ["restaurant_id"], name: "index_meals_on_restaurant_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "meal_id", null: false
    t.integer "person_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_orders_on_meal_id"
    t.index ["person_id"], name: "index_orders_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.integer "event_id"
    t.integer "photographer_id"
    t.string "filename"
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_pictures_on_event_id"
    t.index ["photographer_id"], name: "index_pictures_on_photographer_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "meal_id", null: false
    t.integer "person_id", null: false
    t.decimal "rating", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_ratings_on_meal_id"
    t.index ["person_id"], name: "index_ratings_on_person_id"
  end

  create_table "rental_cars", force: :cascade do |t|
    t.string "company", null: false
    t.string "car_make_model", null: false
    t.string "price", null: false
    t.integer "pickup_location_airport_id", null: false
    t.string "pickup_datetime", null: false
    t.integer "dropoff_location_airport_id", null: false
    t.string "dropoff_datetime", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dropoff_location_airport_id"], name: "index_rental_cars_on_dropoff_location_airport_id"
    t.index ["pickup_location_airport_id"], name: "index_rental_cars_on_pickup_location_airport_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", null: false
    t.string "priority", null: false
    t.string "address"
    t.string "phone"
    t.string "hours"
    t.string "price_range"
    t.string "genre"
    t.string "notes"
    t.string "frommers_guide_book_page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stays", force: :cascade do |t|
    t.integer "trip_id"
    t.integer "leg_id"
    t.integer "hotel_id"
    t.string "price"
    t.string "room_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_stays_on_hotel_id"
    t.index ["leg_id"], name: "index_stays_on_leg_id"
    t.index ["trip_id"], name: "index_stays_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visitors", force: :cascade do |t|
    t.integer "visit_id"
    t.integer "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_visitors_on_person_id"
    t.index ["visit_id"], name: "index_visitors_on_visit_id"
  end

  create_table "visits", force: :cascade do |t|
    t.integer "attraction_id"
    t.string "notes"
    t.string "notes_danger"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attraction_id"], name: "index_visits_on_attraction_id"
  end

  add_foreign_key "rental_cars", "airports", column: "dropoff_location_airport_id"
  add_foreign_key "rental_cars", "airports", column: "pickup_location_airport_id"
end
