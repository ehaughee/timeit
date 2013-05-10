require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader' if development?

require 'haml'
require 'rack-flash'
require 'better_errors' if development?

require './lib/database'
require './lib/seed' if development?

enable :sessions
use Rack::Flash

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path("..", __FILE__)
end

get '/' do
  haml :index
end

get '/timers/?' do
  logger.info "Received GET /timers"
  @timers = Timer.all
  haml :timers
end

get '/timers/:id' do |id|
  @timer = Timer.get(id)
  if @timer
    haml :timer
  else
    flash[:error] = "Could not find timer with id #{id}"
    haml :timers
  end
end

post '/timers/?' do
  logger.info "Received POST /timers: #{params.inspect}"
  timer = Timer.new(
    id:     params[:id],
    name:   params[:name],
    end:    params[:end]
  )

  timer.save!
end