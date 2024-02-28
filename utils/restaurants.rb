require 'yaml'
require 'active_support/all'

restaurants = YAML.load_file('data/restaurants.yml')

File.open('data/restaurants1.yml', 'w+') do |restaurants_file|
  restaurants.each do |restaurant|
    restaurants_file.puts '-'
    restaurants_file.puts "  id: #{restaurant['id']}"
    restaurants_file.puts "  name: #{restaurant['name'].inspect}"
    restaurants_file.puts "  priority: #{restaurant['priority'].inspect}"
    restaurants_file.puts "  address: #{restaurant['address'].inspect}" if restaurant['address'].present?
    restaurants_file.puts "  phone: #{restaurant['phone'].inspect}" if restaurant['phone'].present?
    restaurants_file.puts "  hours: #{restaurant['hours'].inspect}" if restaurant['hours'].present?
    restaurants_file.puts "  price_range: #{restaurant['price_range'].inspect}" if restaurant['price_range'].present?
    restaurants_file.puts "  genre: #{restaurant['genre'].inspect}" if restaurant['genre'].present?
    restaurants_file.puts "  notes: #{restaurant['notes'].inspect}" if restaurant['notes'].present?
    restaurants_file.puts "  frommers_guide_book_page: #{restaurant['frommers_guide_book_page'].inspect}" if restaurant['frommers_guide_book_page'].present?
  end
end
