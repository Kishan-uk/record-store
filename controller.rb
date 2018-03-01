require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/album_controller')
require_relative('controllers/artist_controller')
require('pry-byebug')

get '/' do
  @albums = Album.all()
  @artists = Artist.all()
  erb(:index)
end
