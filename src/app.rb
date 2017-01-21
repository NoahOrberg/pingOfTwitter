require 'sinatra'
require 'sinatra/reloader'
require_relative 'kera_ping.rb'

class MainApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  configure do
    set :stat, {}
  end

  get '/' do
    Kera.new
  end
end
