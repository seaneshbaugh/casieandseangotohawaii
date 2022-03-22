require 'yaml'

legs = YAML.load_file('../data/legs.yml')

first_trip_legs = legs.select { |leg| leg['trip_id'] == 1 }

second_trip_legs = legs.select { |leg| leg['trip_id'] == 2 }

events = YAML.load_file('../data/events.yml')

first_trip_events = events.select { |event| event['eventable_type'] == 'visit' && first_trip_legs.map { |leg| leg['id'] }.include?(event['leg_id']) }

second_trip_events = events.select { |event| event['eventable_type'] == 'visit' && second_trip_legs.map { |leg| leg['id'] }.include?(event['leg_id']) }

visitor_id = 1

File.open('../data/visitors.yml', 'w+') do |visitors_file|
  first_trip_events.each do |event|
    people_ids = [1, 2]

    people_ids.each do |person_id|
      visitors_file.puts '-'
      visitors_file.puts "  id: #{visitor_id}"
      visitors_file.puts "  visit_id: #{event['eventable_id']}"
      visitors_file.puts "  person_id: #{person_id}"

      visitor_id += 1
    end
  end

  event_map = {
    88 => [1, 2, 3, 4, 5], # Papawai Point
    89 => [1, 2], # Ka'anapali Beach
    92 => [1, 2, 5], # Haleakalā National Park
    94 => [1, 2, 5], # Kenolio Park
    98 => [1, 2, 3, 4, 5], # Lāhainā Banyan Court Park
    107 => [1, 2, 3, 4, 5], # ʻĪao Valley State Monument
    109 => [1, 2, 5], # Ka'anapali Beach
    111 => [1, 2, 3, 4, 5], # Ho'okipa Beach Lookout
    112 => [1, 2, 3, 4, 5], # Ho'okipa Beach Park
    113 => [1, 2, 3, 4, 5], # Lower Pāʻia Beach Park
    114 => [1, 2, 5], # Pāʻia Secret Beach
    116 => [1, 2, 3, 4, 5], # Olowalu Petroglyphs
    117 => [1, 2], # Ka'anapali Beach
    118 => [1, 2], # Ka'anapali Beach
    120 => [1, 2, 3, 4], # Mai Poina Beach Park
    121 => [1, 2, 3, 4], # Maluaka Beach
    122 => [1, 2, 3, 4], # Makena Beach
    123 => [1, 2, 3, 4], # Ahihi-Kinau Natural Area Reserve
    124 => [1, 2, 4], # La Perouse Memorial
    125 => [1, 2, 4], # Lava Fields
    129 => [1, 2, 3, 4, 5], # Makaluapuna Point
    130 => [1, 2, 3, 4, 5], # Honolua Bay
    131 => [1, 2, 3, 4, 5], # Nakalele Blowhole
    134 => [1, 2, 3, 4, 5], # Ukumehame Beach Park
    137 => [1, 4], # Waikiki Beach
    138 => [1, 4], # Duke Kahanamoku Statue
    141 => [2], # Waikiki Beach
    142 => [2], # Kūhiō Beach Park
    143 => [2], # Waikiki Wall
    144 => [2], # Queen's Beach
    145 => [2], # War Memorial Natatorium
    146 => [2], # Kaimana Beach
    147 => [2], # Outrigger Canoe Club Beach
    148 => [2], # Tonggs Beach
    149 => [2], # Mākālei Beach Park
    150 => [2], # Sans Souci State Recreational Park
    151 => [2], # Queen's Beach
    152 => [2], # Kūhiō Beach Park
    153 => [2, 4, 5], # Waikiki Beach
    157 => [1, 2, 3, 4, 5], # Steam Vents
    158 => [1, 2, 3, 4, 5], # Kilauea Overlook
    159 => [1, 2, 3, 4, 5], # Nahuku - Thurston Lava Tube
    160 => [1, 2, 4, 5], # Devastation Trail
    161 => [1, 2, 4, 5], # Hale Ma'uma'u Volcano Crater
    162 => [1, 2, 3, 4, 5], # Luamanu Crater
    163 => [1, 2, 3, 4, 5], # Kōko‘Olau Crater
    164 => [1, 2, 3, 4, 5], # Hi'iaka Crater
    165 => [1, 2, 3, 4, 5], # Pauahi Crater
    168 => [1, 2], # Kūhiō Beach Park
    169 => [1, 2], # Prince Jonah Kūhiō Kalanianaʻole Statue
    170 => [1, 2], # Waikiki Wall
    171 => [1, 2], # Queen's Beach
    172 => [1, 2], # War Memorial Natatorium
    173 => [1, 2], # Sans Souci State Recreational Park
    174 => [1, 2], # Kapiʻolani Regional Park
    175 => [1, 2], # Queen's Beach
    176 => [1, 2], # Kūhiō Beach Park
    178 => [1, 2, 4], # Waimānalo Beach Park
    179 => [1, 2, 4], # Maunalua Bay Beach Park
    181 => [1, 2], # Waikiki Beach
    183 => [1, 2, 3, 4, 5], # North Shore Macadamia Nut Company
    184 => [1, 2, 3, 4, 5], # Waimea Bay Beach Park
    185 => [1, 2], # Queen Kapi'olani Statue
    187 => [1, 2, 3, 4, 5], # Shark's Cove
    188 => [1, 2, 3, 4, 5], # Kawela Bay Beach Park
    189 => [1, 2, 3, 4, 5], # Ahupuaʻa ʻO Kahana State Park
    190 => [1, 2, 3, 4, 5], # Kahana Bay Beach Park
    192 => [1, 2], # Kūhiō Beach Park
    193 => [1, 2], # Queen's Beach
    195 => [1, 2], # Queen's Beach
    196 => [1, 2], # Kūhiō Beach Park
    198 => [1, 2], # Mermaid's Secret Cave
    199 => [1, 2], # Mermaid's Secret Cave
    201 => [1, 5], # Diamond Head State Monument
    202 => [1, 5], # Diamond Head Beach Park
    204 => [1, 2, 3, 4, 5], # Pearl Harbor National Memorial
  }

  event_map.each do |event_id, people_ids|
    people_ids.each do |person_id|
      event = events.select { |event| event['id'] == event_id }.first

      visitors_file.puts '-'
      visitors_file.puts "  id: #{visitor_id}"
      visitors_file.puts "  visit_id: #{event['eventable_id']}"
      visitors_file.puts "  person_id: #{person_id}"

      visitor_id += 1
    end
  end
end

# visits = YAML.load_file('../data/visits.yml')
