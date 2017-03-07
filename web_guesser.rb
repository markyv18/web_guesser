require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)
@@count = 5

get '/' do
  @@count -= 1
  if @@count == 0
    guess = nil
  end
  guess = params["guess"].to_i
  cheat = params["cheat"]
  message = check_guess(guess, cheat)
  color = get_color(guess)
  erb :index, :locals => {:message => message, :guess => guess, :color => color}
end

def check_guess(guess, cheat = nil)
  if guess > 101
    message = "WAY off. Let's keep it under 100 shall we?"
  elsif cheat == true
    message "The number is #{NUMBER}, but you cheated!"
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
  elsif guess == nil
    message = "Oops! You've used up all your guesses."
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
  elsif guess == nil
    color = "white"
  end
end
