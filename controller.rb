require('sinatra')
require('sinatra/contrib/all')
require_relative('models/album')
require_relative('models/artist')
require('pry-byebug')

get '/record-store' do
  @albums = Album.all()
  @artists = Artist.all()
  erb(:index)
end
