require 'yaml'
require 'active_support/all'

attractions = YAML.load_file('data/attractions.yml')

File.open('data/attractions1.yml', 'w+') do |attractions_file|
  attractions.each do |attraction|
    attractions_file.puts '-'
    attractions_file.puts "  id: #{attraction['id']}"
    attractions_file.puts "  name: #{attraction['name'].inspect}"
    attractions_file.puts "  attraction_type: #{attraction['attraction_type'].inspect}"
    attractions_file.puts "  priority: #{attraction['priority'].inspect}"
    attractions_file.puts "  address: #{attraction['address'].inspect}" if attraction['address'].present?
    attractions_file.puts "  phone: #{attraction['phone'].inspect}" if attraction['phone'].present?
    attractions_file.puts "  hours: #{attraction['hours'].inspect}" if attraction['hours'].present?
    attractions_file.puts "  notes: #{attraction['notes'].inspect}" if attraction['notes'].present?
    attractions_file.puts "  notes_danger: #{attraction['notes_danger'].inspect}" if attraction['notes_danger'].present?
    attractions_file.puts "  frommers_guide_book_page: #{attraction['frommers_guide_book_page'].inspect}" if attraction['frommers_guide_book_page'].present?
  end
end
