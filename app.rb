require 'sinatra'
require 'sinatra/reloader' if development?

require 'haml'

get '/:value?' do |val|
  @test = val || "Null"
  haml :index
end

get '/hello/:name/:lastname' do |fname, lname|
  "Hello, #{fname} #{lname}!"
end