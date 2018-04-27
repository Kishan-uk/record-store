require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/album_controller')
require_relative('controllers/artist_controller')
require_relative('controllers/album_list')

get '/' do
  @albums = Album.all()
  @artists = Artist.all()
  erb(:index)
end
