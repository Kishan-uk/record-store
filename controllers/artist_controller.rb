require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/artist.rb' )

get '/artist' do
  @artist = Artist.all
  erb(:"artist/new")
end

post '/artist' do
  artist = Artist.new(params)
  artist.save()
  erb(:"artist/create")
end
