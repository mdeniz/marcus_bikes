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
                    base_price: 3500,
                    image: "/assets/products/rocky_mountain_carbon.jpg",
                    enabled: true,
                    stock_available: true,
                    customizable: false,
                    category: mountain_cat).
  find_or_create_by!(brand: "Rocky Mountain", model: "Rocky Mountain Altitude 27.5\" Carbon Frameset", year: 2024)

Product.create_with(description: random_description,
  base_price: 4500,
  image: "/assets/products/rocky_mountain_alloy.jpg",
  enabled: true,
  stock_available: true,
  customizable: false,
  category: enduro_cat).
find_or_create_by!(brand: "Rocky Mountain", model: "Rocky Mountain Altitude MX/29\" Carbon Frameset", year: 2024)

# Customizable bike
customizable_bike = Product.create_with(description: random_description,
  base_price: 0,
  image: "/assets/products/rocky_mountain_customizable.jpg",
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
  base_price: 3000,
  image: "/assets/products/full_suspension.jpg",
  enabled: true,
  stock_available: true,
  customizable: false,
  category: enduro_parts_cat).
find_or_create_by!(brand: "Lexon", model: "Full-suspension", year: 2023)

diamon = Product.create_with(description: random_description,
  base_price: 2000,
  image: "/assets/products/diamon.jpg",
  enabled: true,
  stock_available: true,
  customizable: false,
  category: enduro_parts_cat).
find_or_create_by!(brand: "Mosaic", model: "Diamon", year: 2022)

step_through = Product.create_with(description: random_description,
  base_price: 2000,
  image: "/assets/products/step_through.jpg",
  enabled: true,
  stock_available: true,
  customizable: false,
  category: enduro_parts_cat).
find_or_create_by!(brand: "Transition", model: "Step Through", year: 2023)

# Parts for the Frame finish
matte = Product.create_with(description: random_description,
  base_price: 35,
  image: "/assets/products/matte.jpg",
  enabled: true,
  stock_available: true,
  customizable: false,
  category: enduro_parts_cat).
find_or_create_by!(brand: "Finisher finishes", model: "Matte", year: 2020)

shiny = Product.create_with(description: random_description,
  base_price: 30,
  image: "/assets/products/shiny.jpg",
  enabled: true,
  stock_available: true,
  customizable: false,
  category: enduro_parts_cat).
find_or_create_by!(brand: "Finisher finishes", model: "Shiny", year: 2021)

# Parts for the Wheels
road_wheels = Product.create_with(description: random_description,
  base_price: 80,
  image: "/assets/products/road_wheels.jpg",
  enabled: true,
  stock_available: true,
  customizable: false,
  category: enduro_parts_cat).
find_or_create_by!(brand: "Bucklos", model: "Road wheels", year: 2024)

mountain_wheels = Product.create_with(description: random_description,
  base_price: 70,
  image: "/assets/products/mountain_wheels.jpg",
  enabled: true,
  stock_available: true,
  customizable: false,
  category: enduro_parts_cat).
find_or_create_by!(brand: "Cr*max", model: "Mountain wheels", year: 2022)

fat_bike_wheels = Product.create_with(description: random_description,
  base_price: 100,
  image: "/assets/products/fat_bike_wheels.jpg",
  enabled: true,
  stock_available: true,
  customizable: false,
  category: enduro_parts_cat).
find_or_create_by!(brand: "Vii", model: "Fat bike wheels", year: 2019)

# # Parts for the Rim colors
# red = Product.create_with(description: random_description,
#   base_price: 20,
#   image: "/assets/products/red.jpg",
#   enabled: true,
#   stock_available: true,
#   customizable: false,
#   category: enduro_parts_cat).
# find_or_create_by!(brand: "The Wheeler", model: "Red", year: 2024)

# black = Product.create_with(description: random_description,
#   base_price: 10,
#   image: "/assets/products/black.jpg",
#   enabled: true,
#   stock_available: true,
#   customizable: false,
#   category: enduro_parts_cat).
# find_or_create_by!(brand: "The Wheeler", model: "Black", year: 2022)

# blue = Product.create_with(description: random_description,
#   base_price: 20,
#   image: "/assets/products/blue.jpg",
#   enabled: true,
#   stock_available: true,
#   customizable: false,
#   category: enduro_parts_cat).
# find_or_create_by!(brand: "Half Pipe Wheels", model: "Blue", year: 2019)

# Parts for the Chains
single_speed = Product.create_with(description: random_description,
  base_price: 43,
  image: "/assets/products/single_speed_chain.jpg",
  enabled: true,
  stock_available: true,
  customizable: false,
  category: enduro_parts_cat).
find_or_create_by!(brand: "Chainsaw", model: "Single-speed chain", year: 2024)

eight_speed = Product.create_with(description: random_description,
  base_price: 52,
  image: "/assets/products/eight_speed_chain.jpg",
  enabled: true,
  stock_available: true,
  customizable: false,
  category: enduro_parts_cat).
find_or_create_by!(brand: "KMC", model: "8-speed chain", year: 2022)

#-------------------------------------------------------------------------------------------------------------------------------------
# Customizable options for the customizable bike
#-------------------------------------------------------------------------------------------------------------------------------------

# Full suspension frame options
full_suspension_size = CustomizableAttribute.create_with(description: random_description).find_or_create_by!(name: "Size", order: 1, product: full_suspension)
AttributeOption.create_with(description: random_description).find_or_create_by!(name: "S", price_change: 0, order: 1, stock_available: true, customizable_attribute: full_suspension_size)
AttributeOption.create_with(description: random_description).find_or_create_by!(name: "M", price_change: 50, order: 2, stock_available: true, customizable_attribute: full_suspension_size)
AttributeOption.create_with(description: random_description).find_or_create_by!(name: "L", price_change: 80, order: 3, stock_available: true, customizable_attribute: full_suspension_size)

full_suspension_color = CustomizableAttribute.create_with(description: random_description).find_or_create_by!(name: "Color", order: 1, product: full_suspension)
AttributeOption.create_with(description: random_description).find_or_create_by!(name: "Orange", price_change: 20, order: 1, stock_available: true, customizable_attribute: full_suspension_color)
AttributeOption.create_with(description: random_description).find_or_create_by!(name: "Teal", price_change: 30, order: 2, stock_available: true, customizable_attribute: full_suspension_color)

# Full suspension frame options
diamon_size = CustomizableAttribute.create_with(description: random_description).find_or_create_by!(name: "Size", order: 1, product: diamon)
AttributeOption.create_with(description: random_description).find_or_create_by!(name: "M", price_change: 0, order: 1, stock_available: true, customizable_attribute: diamon_size)
AttributeOption.create_with(description: random_description).find_or_create_by!(name: "L", price_change: 150, order: 2, stock_available: false, customizable_attribute: diamon_size)
AttributeOption.create_with(description: random_description).find_or_create_by!(name: "XL", price_change: 180, order: 3, stock_available: true, customizable_attribute: diamon_size)

diamon_color = CustomizableAttribute.create_with(description: random_description).find_or_create_by!(name: "Color", order: 1, product: diamon)
AttributeOption.create_with(description: random_description).find_or_create_by!(name: "Deep black", price_change: 60, order: 1, stock_available: true, customizable_attribute: diamon_color)
AttributeOption.create_with(description: random_description).find_or_create_by!(name: "Electric Blue", price_change: 90, order: 2, stock_available: true, customizable_attribute: diamon_color)

# Road wheels options
rim_color_road_wheels = CustomizableAttribute.create_with(description: random_description).find_or_create_by!(name: "Rim color", order: 1, product: road_wheels)
AttributeOption.create_with(description: random_description).find_or_create_by!(name: "Red", price_change: 5.0, order: 1, stock_available: true, customizable_attribute: rim_color_road_wheels)
AttributeOption.create_with(description: random_description).find_or_create_by!(name: "Blue", price_change: 6.0, order: 2, stock_available: true, customizable_attribute: rim_color_road_wheels)
AttributeOption.create_with(description: random_description).find_or_create_by!(name: "Black", price_change: 0, order: 3, stock_available: true, customizable_attribute: rim_color_road_wheels)

# Road wheels options
rim_color_road_wheels = CustomizableAttribute.create_with(description: random_description).find_or_create_by!(name: "Rim color", order: 1, product: road_wheels)
AttributeOption.create_with(description: random_description).find_or_create_by!(name: "Red", price_change: 5.0, order: 1, stock_available: true, customizable_attribute: rim_color_road_wheels)
AttributeOption.create_with(description: random_description).find_or_create_by!(name: "Blue", price_change: 6.0, order: 2, stock_available: true, customizable_attribute: rim_color_road_wheels)
AttributeOption.create_with(description: random_description).find_or_create_by!(name: "Black", price_change: 0, order: 3, stock_available: true, customizable_attribute: rim_color_road_wheels)

# Mountain wheels options
rim_color_mountain_wheels = CustomizableAttribute.create_with(description: random_description).find_or_create_by!(name: "Rim color", order: 1, product: mountain_wheels)
AttributeOption.create_with(description: random_description).find_or_create_by!(name: "Black", price_change: 0, order: 3, stock_available: true, customizable_attribute: rim_color_mountain_wheels)

# Fat bike wheels options
rim_color_fat_bike_wheels = CustomizableAttribute.create_with(description: random_description).find_or_create_by!(name: "Rim color", order: 1, product: fat_bike_wheels)
AttributeOption.create_with(description: random_description).find_or_create_by!(name: "Blue", price_change: 16.0, order: 2, stock_available: true, customizable_attribute: rim_color_fat_bike_wheels)
AttributeOption.create_with(description: random_description).find_or_create_by!(name: "Black", price_change: 0, order: 3, stock_available: true, customizable_attribute: rim_color_fat_bike_wheels)


#-------------------------------------------------------------------------------------------------------------------------------------
# Customizable parts for the customizable bike
#-------------------------------------------------------------------------------------------------------------------------------------

frame_type = CustomizablePart.create_with(description: random_description).find_or_create_by!(name: "Frame type", order: 1, product: customizable_bike)
frame_finish = CustomizablePart.create_with(description: random_description).find_or_create_by!(name: "Frame finish", order: 2, product: customizable_bike)
wheels = CustomizablePart.create_with(description: random_description).find_or_create_by!(name: "Wheels", order: 3, product: customizable_bike)
# rim_color = CustomizablePart.create_with(description: random_description).find_or_create_by!(name: "Rim color", order: 4, product: customizable_bike)
chain = CustomizablePart.create_with(description: random_description).find_or_create_by!(name: "Chain", order: 5, product: customizable_bike)

#-------------------------------------------------------------------------------------------------------------------------------------
# Options for customizable parts
#-------------------------------------------------------------------------------------------------------------------------------------

PartOption.find_or_create_by!(product: full_suspension, customizable_part: frame_type)
PartOption.find_or_create_by!(product: diamon, customizable_part: frame_type)
PartOption.find_or_create_by!(product: step_through, customizable_part: frame_type)

PartOption.find_or_create_by!(product: matte, customizable_part: frame_finish)
PartOption.find_or_create_by!(product: shiny, customizable_part: frame_finish)

PartOption.find_or_create_by!(product: road_wheels, customizable_part: wheels)
PartOption.find_or_create_by!(product: mountain_wheels, customizable_part: wheels)
PartOption.find_or_create_by!(product: fat_bike_wheels, customizable_part: wheels)

# PartOption.find_or_create_by!(product: red, customizable_part: rim_color)
# PartOption.find_or_create_by!(product: black, customizable_part: rim_color)
# PartOption.find_or_create_by!(product: blue, customizable_part: rim_color)

PartOption.find_or_create_by!(product: single_speed, customizable_part: chain)
PartOption.find_or_create_by!(product: eight_speed, customizable_part: chain)

#-------------------------------------------------------------------------------------------------------------------------------------
# Banned combinations for some customizable parts
#-------------------------------------------------------------------------------------------------------------------------------------

BannedCombination.find_or_create_by!(source: mountain_wheels, target: diamon)
BannedCombination.find_or_create_by!(source: mountain_wheels, target: step_through)
# BannedCombination.find_or_create_by!(source: fat_bike_wheels, target: red)

#-------------------------------------------------------------------------------------------------------------------------------------
# Price changes for some customizable parts
#-------------------------------------------------------------------------------------------------------------------------------------

PriceChange.find_or_create_by!(changed_product: matte, on_product: full_suspension, change: 15)
