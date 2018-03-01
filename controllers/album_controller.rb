require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/album.rb' )
require_relative( '../models/artist.rb' )



get '/album' do
  @artists = Artist.all
  @album = Album.all
  erb(:"album/new")
end

post '/album' do
  album = Album.new(params)
  album.save()
  erb(:"album/create")
end

get '/album/:id/update' do
  @artists = Artist.all
  @album = Album.find(params[:id].to_i)
  erb(:update)
end

post '/album/:id' do
  album = Album.new(params)
  album.update()
  redirect to "/"
end

post '/album/:id/delete' do
  album = Album.new(params)
  album.delete()
  redirect to "/"
end
