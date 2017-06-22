# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all

c1 = Cat.create!(birth_date: "2009/03/20", color: "Brown", name: "Tansy", sex: "F", description: "the softest, fluffiest, cat you've ever seen!" )
c2 = Cat.create!(birth_date: "2004/05/24", color: "White", name: "Mr.Fluffy Paws", sex: "M", description: "fluffy paws" )
c3 = Cat.create!(birth_date: "2013/02/10", color: "Orange", name: "Frank", sex: "M", description: "a frank cat" )

CatRentalRequest.destroy_all

crr1 = {cat_id: c1.id, start_date: "2017/06/20", end_date: "2017/06/27"}
crr2 = {cat_id: c1.id, start_date: "2017/07/20", end_date: "2017/07/27", status: "DENIED"}
crr3 = {cat_id: c3.id, start_date: "2017/06/20", end_date: "2017/06/27", status: "APPROVED"}


CatRentalRequest.create!(crr1)
CatRentalRequest.create!(crr2)
CatRentalRequest.create!(crr3)
