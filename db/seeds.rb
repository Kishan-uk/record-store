require_relative('../models/artist.rb')
require_relative('../models/album.rb')
require("pry-byebug")

Artist.delete_all()
Album.delete_all()


artist1 = Artist.new({ 'name' => 'Air'})
artist2 = Artist.new({ 'name' => 'Daft Punk'})
artist3 = Artist.new({ 'name' => 'Vitalic'})

artist1.save()
artist2.save()
artist3.save()

album1 = Album.new({
  'title' => 'Moon Safari',
  'quantity' => '57',
  'artist_id' => artist1.id})

album2 = Album.new({
    'title' => 'Homework',
    'quantity' => '31',
    'artist_id' => artist2.id})

album3 = Album.new({
  'title' => 'OK Cowboy',
  'quantity' => '20',
  'artist_id' => artist3.id})

album1.save()
album2.save()
album3.save()

binding.pry

nil
