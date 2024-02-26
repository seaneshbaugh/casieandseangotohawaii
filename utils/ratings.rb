require 'yaml'

meals = YAML.load_file('data/meals.yml')
people = YAML.load_file('data/people.yml')

File.open('data/ratings.yml', 'w+') do |ratings_file|
  id = 1

  meals.each do |meal|
    next unless meal['ratings']

    meal['ratings'].each do |name, rating|
      person = people.select { |p| p['name'] == name }.first

      raise if person.nil?

      ratings_file.puts '-'
      ratings_file.puts "  id: #{id}"
      ratings_file.puts "  meal_id: #{meal['id']}"
      ratings_file.puts "  person_id: #{person['id']}"
      ratings_file.puts "  rating: #{rating}"

      id += 1
    end
  end
end
