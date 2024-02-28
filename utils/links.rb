require 'yaml'

airports  =YAML.load_file('data/airports.yml')
restaurants = YAML.load_file('data/restaurants.yml')
hotels = YAML.load_file('data/hotels.yml')
attractions = YAML.load_file('data/attractions.yml')

File.open('data/links.yml', 'w+') do |links_file|
  id = 1

  airports.each do |airport|
    next unless airport['links']

    airport['links'].each do |link|
      links_file.puts '-'
      links_file.puts "  id: #{id}"
      links_file.puts "  linkable_id: #{airport['id']}"
      links_file.puts "  linkable_type: \"airport\""
      links_file.puts "  link_type: #{link['link_type'].inspect}"
      links_file.puts "  url: #{link['url'].inspect}"

      id += 1
    end
  end

  restaurants.each do |restaurant|
    next unless restaurant['links']

    restaurant['links'].each do |link|
      links_file.puts '-'
      links_file.puts "  id: #{id}"
      links_file.puts "  linkable_id: #{restaurant['id']}"
      links_file.puts "  linkable_type: \"restaurant\""
      links_file.puts "  link_type: #{link['link_type'].inspect}"
      links_file.puts "  url: #{link['url'].inspect}"

      id += 1
    end
  end

  hotels.each do |hotel|
    next unless hotel['links']

    hotel['links'].each do |link|
      links_file.puts '-'
      links_file.puts "  id: #{id}"
      links_file.puts "  linkable_id: #{hotel['id']}"
      links_file.puts "  linkable_type: \"hotel\""
      links_file.puts "  link_type: #{link['link_type'].inspect}"
      links_file.puts "  url: #{link['url'].inspect}"

      id += 1
    end
  end

  attractions.each do |attraction|
    next unless attraction['links']

    attraction['links'].each do |link|
      links_file.puts '-'
      links_file.puts "  id: #{id}"
      links_file.puts "  linkable_id: #{attraction['id']}"
      links_file.puts "  linkable_type: \"attraction\""
      links_file.puts "  link_type: #{link['link_type'].inspect}"
      links_file.puts "  url: #{link['url'].inspect}"

      id += 1
    end
  end
end
