require 'yaml'

events = YAML.load_file('../data/events.yml')

File.open('../data/new_events.yml', 'w+') do |events_file|
  events.each_with_index do |event, index|
    events_file.puts '-'
    events_file.puts "  id: #{index + 1}"
    events_file.puts "  leg_id: #{event['leg_id']}"
    events_file.puts "  day_id: #{event['day_id']}"
    events_file.puts "  eventable_type: \"#{event['eventable_type']}\""
    events_file.puts "  eventable_id: #{event['eventable_id']}"
    events_file.puts "  order: #{event['order']}"
  end
end
