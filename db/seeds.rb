def random_description
  Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false)
end

#-------------------------------------------------------------------------------------------------------------------------------------
# Hierarchy of Categories
#-------------------------------------------------------------------------------------------------------------------------------------

# Root categories
bike_cat = Category.create_with(description: random_description).find_or_create_by!(name: "Bike", order: 1)
ski_cat = Category.create_with(description: random_description).find_or_create_by!(name: "Ski", order: 2)
surf_cat = Category.create_with(description: random_description).find_or_create_by!(name: "Surf", order: 3)
skate_cat = Category.create_with(description: random_description).find_or_create_by!(name: "Skate", order: 4)

# Bike types
mountain_cat = Category.create_with(description: random_description).find_or_create_by!(name: "Mountain", order: 1, parent: bike_cat)
road_cat = Category.create_with(description: random_description).find_or_create_by!(name: "Road", order: 2, parent: bike_cat)
enduro_cat = Category.create_with(description: random_description).find_or_create_by!(name: "Enduro", order: 3, parent: bike_cat)
trail_cat = Category.create_with(description: random_description).find_or_create_by!(name: "Trail", order: 4, parent: bike_cat)
bmx_cat = Category.create_with(description: random_description).find_or_create_by!(name: "BMX", order: 5, parent: bike_cat)
city_cat = Category.create_with(description: random_description).find_or_create_by!(name: "City", order: 6, parent: bike_cat)

# Bike parts
enduro_parts_cat = Category.create_with(description: random_description).find_or_create_by!(name: "Enduro Parts", order: 1, parent: enduro_cat)

# Ski types
[ "Piste", "Alpine", "Racing", "Freestyle" ].each_with_index do |name, i|
  Category.create_with(description: random_description).find_or_create_by!(name: name, order: i, parent: ski_cat)
end

# Surf types
[ "Fish", "Shortboard", "Hybrid", "Gun", "Funboard", "Hull", "Longboard" ].each_with_index do |name, i|
  Category.create_with(description: random_description).find_or_create_by!(name: name, order: i, parent: surf_cat)
end

# Skate types
[ "Traditional", "Cruiser", "Longboard", "Freestyle", "Slalom", "Street" ].each_with_index do |name, i|
  Category.create_with(description: random_description).find_or_create_by!(name: name, order: i, parent: skate_cat)
end

#-------------------------------------------------------------------------------------------------------------------------------------
# Some bikes
#-------------------------------------------------------------------------------------------------------------------------------------

# Non customizable bikes
Product.create_with(description: random_description,
                    price: 3500,
                    image: "https://content.bikologi.com/bike/2024/rocky-mountain/altitude-c---v2-black-desktop.png",
                    enabled: true,
                    stock_available: true,
                    customizable: false,
                    category: mountain_cat).
  find_or_create_by!(brand: "Rocky Mountain", model: "Rocky Mountain Altitude 27.5\" Carbon Frameset", year: 2024)

Product.create_with(description: random_description,
  price: 4500,
  image: "https://content.bikologi.com/bike/2024/rocky-mountain/altitude-green-desktop.png",
  enabled: true,
  stock_available: true,
  customizable: false,
  category: enduro_cat).
find_or_create_by!(brand: "Rocky Mountain", model: "Rocky Mountain Altitude MX/29\" Carbon Frameset", year: 2024)

# Customizable bike
customizable_bike = Product.create_with(description: random_description,
  price: 0,
  image: "https://content.bikologi.com/bike/2024/rocky-mountain/element-beige-gray-desktop.png",
  enabled: true,
  stock_available: true,
  customizable: true,
  category: enduro_cat).
find_or_create_by!(brand: "Rocky Mountain", model: "Customizable Rocky Mountain", year: 2024)

#-------------------------------------------------------------------------------------------------------------------------------------
# Some parts
#-------------------------------------------------------------------------------------------------------------------------------------

# Parts for the Frame type
full_suspension = Product.create_with(description: random_description,
  price: 3000,
  image: "https://content.bikologi.com/bike/2024/rocky-mountain/altitude-green-desktop.png",
  enabled: true,
  stock_available: true,
  customizable: false,
  category: enduro_parts_cat).
find_or_create_by!(brand: "Rocky Mountain", model: "Full-suspension", year: 2023)

diamon = Product.create_with(description: random_description,
  price: 2000,
  image: "https://content.bikologi.com/bike/2024/rocky-mountain/altitude-c---v2-black-desktop.png",
  enabled: true,
  stock_available: true,
  customizable: false,
  category: enduro_parts_cat).
find_or_create_by!(brand: "Rocky Mountain", model: "Diamon", year: 2022)

step_through = Product.create_with(description: random_description,
  price: 2000,
  image: "https://content.bikologi.com/bike/2024/rocky-mountain/element-beige-gray-desktop.png",
  enabled: true,
  stock_available: true,
  customizable: false,
  category: enduro_parts_cat).
find_or_create_by!(brand: "Transition", model: "Step Through", year: 2023)

# Parts for the Frame finish
matte = Product.create_with(description: random_description,
  price: 40,
  image: "https://content.bikologi.com/bike/2024/rocky-mountain/altitude-green-desktop.png",
  enabled: true,
  stock_available: true,
  customizable: false,
  category: enduro_parts_cat).
find_or_create_by!(brand: "Finisher finishes", model: "Matte", year: 2020)

shiny = Product.create_with(description: random_description,
  price: 30,
  image: "https://content.bikologi.com/bike/2024/rocky-mountain/altitude-c---v2-black-desktop.png",
  enabled: true,
  stock_available: true,
  customizable: false,
  category: enduro_parts_cat).
find_or_create_by!(brand: "Finisher finishes", model: "Shiny", year: 2021)

# Parts for the Wheels
road_wheels = Product.create_with(description: random_description,
  price: 80,
  image: "https://content.bikologi.com/bike/2024/rocky-mountain/altitude-green-desktop.png",
  enabled: true,
  stock_available: true,
  customizable: false,
  category: enduro_parts_cat).
find_or_create_by!(brand: "The Wheeler", model: "Road wheels", year: 2024)

mountain_wheels = Product.create_with(description: random_description,
  price: 70,
  image: "https://content.bikologi.com/bike/2024/rocky-mountain/altitude-c---v2-black-desktop.png",
  enabled: true,
  stock_available: true,
  customizable: false,
  category: enduro_parts_cat).
find_or_create_by!(brand: "The Wheeler", model: "Mountain wheels", year: 2022)

fat_bike_wheels = Product.create_with(description: random_description,
  price: 100,
  image: "https://content.bikologi.com/bike/2024/rocky-mountain/element-beige-gray-desktop.png",
  enabled: true,
  stock_available: true,
  customizable: false,
  category: enduro_parts_cat).
find_or_create_by!(brand: "Half Pipe Wheels", model: "Fat bike wheels", year: 2019)

#-------------------------------------------------------------------------------------------------------------------------------------
# Customizable parts for the customizable bike
#-------------------------------------------------------------------------------------------------------------------------------------

CustomizablePart.create_with(description: random_description).find_or_create_by!(name: "Frame type", order: 1, product: customizable_bike)
CustomizablePart.create_with(description: random_description).find_or_create_by!(name: "Frame finish", order: 2, product: customizable_bike)
CustomizablePart.create_with(description: random_description).find_or_create_by!(name: "Wheels", order: 3, product: customizable_bike)
CustomizablePart.create_with(description: random_description).find_or_create_by!(name: "Rim color", order: 4, product: customizable_bike)
CustomizablePart.create_with(description: random_description).find_or_create_by!(name: "Chain", order: 5, product: customizable_bike)