#!/usr/bin/env ruby
require_relative '../lib/tennis.rb'
require_relative '../lib/helpers.rb'

puts "Welcome to Tyler's Tennis app! Would you like to [P]lay, adjust the [S]ettings, or [Q]uit?"
loop do
  print "=> "
  input = gets.strip.downcase
  if input == 's'
    puts "This feature is under construction. Please make a different selection."
  elsif input == 'p'
    game = Tennis.new
    game.play
    puts "That was fun! Would you like to [P]lay again, adjust the [S]ettings, or [Q]uit?"
  elsif input == 'q'
    puts "OK, bye!"
    break
  else
    puts "Unrecognized input. Please enter 'P', 'S', or 'Q'."
  end  
end