#!/usr/bin/env ruby
require_relative 'zach'

def zach
  import_json("zach.json")
end

def import_json(filename)
    json_file = File.read(filename)
    JSON.parse(json_file)
end

class SantasTarget
  def initialize(name)
    @name = name
    @naughty = naughty
    @nice = nice
    import_json("#{name.downcase}.json")
  end
  
  def naughty
    get_values("naughty")
  end
  
  def nice
    get_values("nice")
  end

  def get_values(val)
    sum = 0
    zach.each do |month, days|
      sum += days.filter { |day| day.eql? val }.count  
    end
    sum
  end

  def naughty_or_nice()
    if nice > naughty
      puts "#{@name} Zach is noice!"
    elsif nice < naughty
      puts "#{@name} is naughty"
    else
      puts "#{@name} is balanced"
    end
  end
  
  def say_naughty
    puts "naughty count is #{@naughty}"
  end
  
  def say_nice
    puts "nice count is #{@nice}"
  end
end

zach = SantasTarget.new("Zach")
zach.say_naughty
zach.say_nice
zach.naughty_or_nice