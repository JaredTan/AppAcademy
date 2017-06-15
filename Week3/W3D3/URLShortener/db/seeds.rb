# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

user1 = User.create(e_mail: 'hotcakes123@gmail.com')
user2 = User.create(e_mail: 'potatoes1229@yahoo.com')
user3 = User.create(e_mail: 'jonlikesstrawberries@hotmail.com')
user4 = User.create(e_mail: 'croissantsavant@yahoo.com')

ShortenedUrl.destroy_all

url1 = ShortenedUrl.create!(user1, 'https://github.com/jonathanlofton/curriculum/tree/master/sql/projects/url_shortener')
url2 = ShortenedUrl.create!(user2, 'https://en.wikipedia.org/wiki/Base64')
url3 = ShortenedUrl.create!(user3, 'https://www.youtube.com/watch?v=RRTsQmGM53c')
url4 = ShortenedUrl.create!(user4, 'facebook.com')


Visit.destroy_all

visit1 = Visit.record_visit!(user1, url1)
visit2 = Visit.record_visit!(user2, url3)
visit3 = Visit.record_visit!(user3, url2)
visit4 = Visit.record_visit!(user2, url2)
