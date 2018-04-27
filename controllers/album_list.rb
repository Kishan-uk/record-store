require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/album.rb' )
require_relative( '../models/artist.rb' )


get '/album_list' do
  @artists = Artist.all
  @albums = Album.all
  erb(:"album_list/index")
end
