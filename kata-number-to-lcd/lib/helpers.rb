#!/usr/bin/env ruby
require_relative '../lib/config.rb'

def input_number
  input = Integer(gets.strip) rescue false
  until input
    type_out "I didn't quite get that. \nKeep in mind that I can only understand numbers. \nPlease enter a number you'd like to display: "
    input = Integer(gets.strip) rescue false
  end
  return input
end

def type_out(words, interval = 0.01)
  chars = words.chars
  until chars.empty?
    char = chars.shift
    print char
    if char =~ /\n/
      sleep interval * 3
    elsif char =~ /\S/
      putc 7
      sleep interval
    else
      sleep interval
    end
  end
end