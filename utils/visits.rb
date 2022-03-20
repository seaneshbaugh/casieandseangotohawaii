require 'yaml'

attractions = YAML.load_file('../data/attractions.yml')

events = YAML.load_file('../data/events.yml')

events_dict = {}

File.open('../data/visits.yml', 'w+') do |visits_file|
  events.select { |event| event['eventable_type'] == 'attraction' }.each_with_index do |event, index|
    events_dict[event['id']] = index + 1

    visits_file.puts '-'
    visits_file.puts "  id: #{index + 1}"
    visits_file.puts "  attraction_id: #{event['eventable_id']}"
    visits_file.puts "  notes: #{event['notes'].inspect}" if event['notes']
    visits_file.puts "  notes_danger: #{event['notes_danger'].inspect}" if event['notes_danger']
  end
end

File.open('../data/new_events.yml', 'w+') do |events_file|
  events.each do |event|
    eventable_type = if event['eventable_type'] == 'attraction'
                       'visit'
                     else
                       event['eventable_type']
                     end

    eventable_id = if eventable_type == 'visit'
                     events_dict[event['id']]
                   else
                     event['eventable_id']
                   end

    events_file.puts '-'
    events_file.puts "  id: #{event['id']}"
    events_file.puts "  leg_id: #{event['leg_id']}"
    events_file.puts "  day_id: #{event['day_id']}"
    events_file.puts "  eventable_type: #{eventable_type}"
    events_file.puts "  eventable_id: #{eventable_id}"
    events_file.puts "  order: #{event['order']}"
  end
end
