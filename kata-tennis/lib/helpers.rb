#!/usr/bin/env ruby
require_relative '../lib/config.rb'

def get_name
  input = gets.strip
  while input.to_s != input || input.length < 1
    type_out "I didn't quite get that. \nCan you type it again?\n"
    input = gets.strip
  end
  input
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