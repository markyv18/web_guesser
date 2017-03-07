require 'sinatra'
require 'sinatra/reloader'


SECRET_NUMBER = rand(100)


get '/' do
  "THE SECRET NUMBER IS #{SECRET_NUMBER}"
end
