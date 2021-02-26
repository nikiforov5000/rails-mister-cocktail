# require 'json'
require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list

puts "destroy all"
Cocktail.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
file = open(url).read
cocktails_names = JSON.parse(file)
i = 0
20.times do
  name = cocktails_names['drinks'][i]["strIngredient1"]
  puts name
  Ingredient.create(name: name)
  i += 1
  puts "generating #{i}"
end
puts "finish"


# # puts "#{user['name']} - #{user['bio']}"
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")