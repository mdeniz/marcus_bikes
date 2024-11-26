# Root categories
bike_cat = Category.find_or_create_by!(name: "Bike", description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false), order: 1)
ski_cat = Category.find_or_create_by!(name: "Ski", description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false), order: 2)
surf_cat = Category.find_or_create_by!(name: "Surf", description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false), order: 3)
skate_cat = Category.find_or_create_by!(name: "Skate", description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false), order: 4)

# Bike types
[ "Mountain", "Road", "Enduro", "Trail", "BMX", "City", "Foldable" ].each_with_index do |name, i|
  Category.find_or_create_by!(name: name, description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false), order: i, parent: bike_cat)
end

# Ski types
[ "Piste", "Alpine", "Racing", "Freestyle" ].each_with_index do |name, i|
  Category.find_or_create_by!(name: name, description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false), order: i, parent: ski_cat)
end

# Surf types
[ "Fish", "Shortboard", "Hybrid", "Gun", "Funboard", "Hull", "Longboard" ].each_with_index do |name, i|
  Category.find_or_create_by!(name: name, description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false), order: i, parent: surf_cat)
end

# Skate types
[ "Traditional", "Cruiser", "Longboard", "Freestyle", "Slalom", "Street" ].each_with_index do |name, i|
  Category.find_or_create_by!(name: name, description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false), order: i, parent: skate_cat)
end
