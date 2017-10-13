1. Find the albums recorded by the artist Queen.
Album.where(artist_id: (Artist.find_by(name: "Queen")))


2. Count how many tracks belong to the media type "Protected MPEG-4 video file".
Track.where(media_type_id: MediaType.find_by(name: "Protected MPEG-4 video file")).count
# 214


3. Find the genre with the name "Hip Hop/Rap".
Genre.find_by(name: "Hip Hop/Rap")
# #<Genre:0x007fc5da9673a8> {
#             :id => 17,
#           :name => "Hip Hop/Rap",
#     :created_at => Sun, 20 Jan 2013 02:04:31 UTC +00:00,
#     :updated_at => Wed, 29 Jan 2014 22:14:08 UTC +00:00
# }


4. Count how many tracks belong to the "Hip Hop/Rap" genre
Track.where(genre_id: Genre.find_by(name: "Hip Hop/Rap")).count
# 35


5. Find the total amount of time required to listen to all the tracks in the database.
Track.sum(:milliseconds)
# 1378575827


6. Find the highest price of any track that has the media type "MPEG audio file".
Track.where(media_type_id: MediaType.find_by(name: "MPEG audio file")).maximum(:unit_price)
# 0.99


7. Find the name of the most expensive track that has the media type "MPEG audio file".
most_expensive = Track.find_by(unit_price: 0.99, media_type_id: MediaType.find_by(name: "MPEG audio file"))
most_expensive.name
# "Put The Finger On You"


8. Find the 2 oldest artists.
Artist.order(created_at: :asc).limit(2)
# [
#     [0] #<Artist:0x007fc5de4e92a0> {
#                 :id => 258,
#               :name => "Les Arts Florissants & William Christie",
#         :created_at => Fri, 13 Feb 2004 06:08:36 UTC +00:00,
#         :updated_at => Wed, 29 Jan 2014 22:10:22 UTC +00:00
#     },
#     [1] #<Artist:0x007fc5de4e9160> {
#                 :id => 31,
#               :name => "Baby Consuelo",
#         :created_at => Mon, 16 Feb 2004 22:04:39 UTC +00:00,
#         :updated_at => Wed, 29 Jan 2014 22:10:22 UTC +00:00
#     }
# ]

9. Find the least expensive track that has the genre "Electronica/Dance".
least_expensive_price = Track.minimum(:unit_price)
Track.find_by(unit_price: least_expensive_price, genre_id: Genre.find_by(name: "Electronica/Dance"))
# #<Track:0x007fc5da66eae8> {
#                :id => 3319,
#          :album_id => 259,
#          :genre_id => 15,
#     :media_type_id => 1,
#              :name => "Instinto Colectivo",
#          :composer => nil,
#      :milliseconds => 300564,
#             :bytes => 12024875,
#        :unit_price => 0.99,
#        :created_at => Mon, 27 Sep 2004 22:40:29 UTC +00:00,
#        :updated_at => Wed, 29 Jan 2014 22:15:04 UTC +00:00
# }


10. Find all "MPEG autio file" tracks in the genre "Electronica/Dance".
media_id = MediaType.find_by(name: "MPEG audio file")
# 1
electronica_genre_id = Genre.find_by(name: "Electronica/Dance")
# 15
Track.where(media_type_id: media_id, genre_id: electronica_genre_id)
