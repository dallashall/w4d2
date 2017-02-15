# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




Cat.create!(birth_date: Date.new(1980, 2, 14), color: "blue", name: "Elvis", sex: "m", description: "Old fat cat; about to die")
Cat.create!(birth_date: Date.new(2015, 1, 1), color: "yellow", name: "Scooter", sex: "f", description: "Young spry cat")

CatRentalRequest.create!(cat_id: 38, start_date: Date.new(2017,2,14), end_date: Date.new(2017, 2, 28))
CatRentalRequest.create!(cat_id: 38, start_date: Date.new(2017,3,7), end_date: Date.new(2017, 3, 14))
