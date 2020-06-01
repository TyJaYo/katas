#!/usr/bin/env ruby

require_relative '../lib/number_writer'
require_relative '../lib/config'  #empty
require_relative '../lib/helpers'

def greeting
  type_out "Welcome to The Number Writer! \nWhat number would you like to display? \n"
end

def play_loop
  play_again = true
  while play_again 
    number = input_number
    show_number(number)
    play_again = request_replay
  end
end

def request_replay
  type_out "Would you like to play again? \n"
  input = gets.strip.downcase
  input&.chars.first == 'y'
end

def farewell
  type_out "Goodbye! Hope you had fun. \n"
end

greeting  # welcome the user
play_loop # user plays one or more games 
farewell  # wrap up