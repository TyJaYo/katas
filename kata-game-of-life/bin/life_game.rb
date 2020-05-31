#!/usr/bin/env ruby

require '../lib/life.rb'
require '../lib/config.rb'  #empty
require '../lib/helpers.rb' #empty

greeting  # welcome the user
play_loop # user plays one or more games 
farewell  # wrap up

def greeting
  puts "Welcome to the Game of Life!"
end

def play_loop
  play_again? = false
  while play_again? 
    get_board
    advance_loop
  end
end

def farewell
  puts "Goodbye! Hope you had fun."
end