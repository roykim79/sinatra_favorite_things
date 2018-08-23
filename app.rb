require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/thing'
require 'pry'

get '/' do
  Thing.clear()
  @things = Thing.all()
  erb :list
end

post '/' do
  name = params.fetch('thing')
  thing = Thing.new(name)
  thing.save()
  @things = Thing.all()
  erb :list
end
