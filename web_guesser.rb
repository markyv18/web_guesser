require 'sinatra'
require 'sinatra/reloader'

@num = rand(100)
get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  color = get_color(guess)
  if guess == nil
    guess = 0
  end
  erb :index, :locals => {:message => message, :color => color, :guess => guess}
end

def check_guess(guess)
  if guess > (@num + 5)
    message = " Way too high!"
  elsif guess < (@num - 5)
    message = "Way too low!"
  elsif guess < @num
    message = "Too low!"
  elsif guess > @num
    message = "Too high!"
  else
    message = "You got it right! The @number is #{@num}."
  end
end

def get_color(guess)
  if guess > (@num + 5) || guess < (@num - 5)
    color = "red"
  elsif guess < @num || guess > @num
    color = "purple"
  else
    color = "green"
  end
end
