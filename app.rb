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
  ranking = params.fetch('ranking')
  thing = Thing.new(name, ranking)
  thing.save()
  Thing.sort()
  @things = Thing.all()
  erb :list
end
