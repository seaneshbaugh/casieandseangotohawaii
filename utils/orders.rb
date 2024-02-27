require 'yaml'

meals = YAML.load_file('data/meals.yml')
people = YAML.load_file('data/people.yml')

File.open('data/orders.yml', 'w+') do |orders_file|
  id = 1

  meals.each do |meal|
    next unless meal['food']

    meal['food'].each do |name, orders|
      person = people.select { |p| p['name'] == name }.first

      if person.nil? && name != 'Shared'
        puts meal.inspect
        puts name
        raise
      end

      orders.each do |order|
        person_id = if person
                      person['id']
                    else
                      'null'
                    end

        orders_file.puts '-'
        orders_file.puts "  id: #{id}"
        orders_file.puts "  meal_id: #{meal['id']}"
        orders_file.puts "  person_id: #{person_id}"
        orders_file.puts "  food: #{order.inspect}"

        id += 1
      end
    end
  end
end
