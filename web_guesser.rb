require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  color = get_color(guess)
  erb :index, :locals => {:message => message, :guess => guess, :color => color}
end

def check_guess(guess)
  if guess > 101
  message = "WAY off. Let's keep it under 100 shall we?"
  elsif guess > (NUMBER + 10)
    message = " Way too high! You are more than 10 digits too high."
  elsif guess < (NUMBER - 10)
    message = "Way too low! You are more than 10 digits too low."
  elsif guess < NUMBER
    message = "Too low! But within 10 digits!"
  elsif guess > NUMBER
    message = "Too high! But within 10 digits!"
  elsif guess == NUMBER
    message = "You got it right! The number is #{NUMBER}."
  end
end

def get_color(guess)
  if guess > 101
  color = "blue"
  elsif guess > (NUMBER + 10) || guess < (NUMBER - 10)
    color = "red"
  elsif guess < NUMBER || guess > NUMBER
    color = "yellow"
  elsif guess == NUMBER
    color = "green"
  end
end
