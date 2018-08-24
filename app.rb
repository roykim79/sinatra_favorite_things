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
  @string = nil
  if (Thing.all.any? { |thing| thing.name == name}) | (Thing.all.any? { |thing| thing.ranking == ranking})
    @string = 'Cant duplicate'
  else
    thing = Thing.new(name, ranking)
    thing.save()
    Thing.sort()
  end
  @things = Thing.all()
  erb :list
end
