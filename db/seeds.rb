# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

puts "Calling API to get ingredients.."

url_serialized = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
json = JSON.parse(url_serialized)

puts "Making ingredient instances...."

json['drinks'].each_with_index do | _item, index |
  Ingredient.create(
    name: json['drinks'][index]['strIngredient1']
    )
end

puts "Finished!"
