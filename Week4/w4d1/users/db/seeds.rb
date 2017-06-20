# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create(username: 'Chocoboy123')
user2 = User.create(username: 'Legendairy')
user3 = User.create(username: 'TurnipTheBeet')

artwork1 = Artwork.create(title: 'Chocolate Cake', image_url: 'http://1.bp.blogspot.com/-VfYsGs6MAI8/UPmaxb5GezI/AAAAAAAACOw/ftLQ0lO3JeQ/s1600/130118+chocolate+cake.jpg', artist_id: user1.id)
artwork2 = Artwork.create(title: 'Cheesecake', image_url: 'http://1.bp.blogspot.com/_uk880kG2WUY/TCafRlUGb4I/AAAAAAAAD6I/T6Gkm-u79CM/s1600/SmP258.jpg', artist_id: user2.id)
artwork3 = Artwork.create(title: 'Lettuce Turnip The Beet', image_url: 'https://s-media-cache-ak0.pinimg.com/236x/d2/af/14/d2af14bdd8d49f3495260e4a2004acae.jpg', artist_id: user3.id)

artwork_share1 = ArtworkShare.create(artwork_id: artwork1.id, viewer_id: user2.id)
artwork_share2 = ArtworkShare.create(artwork_id: artwork2.id, viewer_id: user1.id)
artwork_share3 = ArtworkShare.create(artwork_id: artwork2.id, viewer_id: user3.id)
artwork_share4 = ArtworkShare.create(artwork_id: artwork3.id, viewer_id: user3.id)
