#!/usr/bin/env ruby
require_relative '../lib/helpers.rb'

SCORE_TABLE = ['Love','15','30','40']

class Tennis
  def initialize
    @winner   = ''
    @services = 0
    @deuces = 0
    @players  = []
  end

  def players
    @players
  end

  def entered_deuce?
    @players.all? { |p| p.points >= 3 }
  end

  def won?
    if entered_deuce? 
      if @players[0] > @players[1] && @players[0].points - @players[1].points >= 2
        @winner = @players[0]
        return true
      elsif @players[1] > @players[0] && @players[1].points - @players[0].points >= 2
        @winner = @players[1]
        return true
      end
    elsif @players.any? { |p| p.points >= 4 }
      @winner = @players.find { |p| p.points >= 4 }
      return true
    end
  end

  def get_score(player)
      SCORE_TABLE[player.points]
  end

  def say_score
    if entered_deuce? 
      if @players[0] > @players[1]
        type_out "Advantage #{@players[0].name}!\n"
      elsif @players[1] > @players[0]
        type_out "Advantage #{@players[1].name}!\n"
      elsif @players[1] == @players[0]
        @deuces += 1
        if @deuces == 1
          type_out "Deuce!\n"
        else
          type_out "Deuce #{@deuces}!\n"
        end
      else
        type_out "I think it's Deuce, but I'm not sure of the score.\n"
      end
    elsif @players[0] > @players[1]
      type_out "#{@players[0].name} is ahead at #{get_score @players[0]}. Player #{@players[1].number} is at #{get_score @players[1]}.\n"
    elsif @players[1] > @players[0]
      type_out "#{@players[1].name} is ahead at #{get_score @players[1]}. Player #{@players[0].number} is at #{get_score @players[0]}.\n"
    elsif @players[0] == @players[1] && @players[0].points == 0
      type_out "It's #{get_score @players[0]} all here at the start of the game.\n"
    elsif @players[0] == @players[1]
      type_out "It's all tied up at #{get_score @players[0]}!\n"
    else
      type_out "I somehow lost track of the score.\n"
    end
  end

  def service 
    @services += 1
    point_won = false
    say_score
    type_out "Here comes service number #{@services}!\n"
    # FUN GOES HERE
    type_out "Who won the point? \nEnter a player's name or number: "
    alleged_point_winner = get_name
    until point_won
      if alleged_point_winner == @players[0].name || alleged_point_winner == @players[0].number.to_s
        @players[0].award_point
        point_won = true
      elsif alleged_point_winner == @players[1].name || alleged_point_winner == @players[1].number.to_s
        @players[1].award_point
        point_won = true
      else
        type_out "Who? \nPlayer 1 is #{@players[0].name} and Player 2 is #{@players[1].name}. \nThey're the only people who can get points at this point... \nI want to know which one won one! \nEnter one of their names or numbers: "
        alleged_point_winner = get_name
      end
    end
  end
  def play
    type_out "Anybody for tennis? \nWho wants to be player one? \nPlease enter a name: "
    @players << Player.new(get_name,'1')
    until @players[0].name != '2'
      type_out "I need to reserve '2' as an alias for your opponent. \nI'm worried that I'll get confused if Player 1 has the name '2'. \nPlease enter a new name: "
      @players[0].name = get_name
    end
    type_out "OK! Nice to meet you, #{@players[0].name}! \nWho dares challenge you today? \nPlease enter a name: "
    @players << Player.new(get_name,'2')
    until @players[1].name != @players[0].name && @players[1].name != @players[0].number
      type_out "You have the same moniker as Player 1! \nI'm worried that that will get confusing. \nCan you try to be more unique? \nPlease enter a new name: "
      @players[1].name = get_name
    end
    type_out "OK! Nice to meet you, too, #{@players[1].name}! \nThis is sure to be an epic contest.\n"
    until won?
      service
    end
    type_out "We have a winner! What a thrilling game. \n"
    if @deuces > 1
      type_out "After #{@deuces} deuces and #{@services} total serves, #{@winner.name} emerged victorious.\n"      
    end
    type_out "Congratulations, #{@winner.name}!\n"
  end
end

class Player
  include Comparable

  def initialize(name,number)
    @name   = name
    @number = number
    @points = 0
  end

  def name=(name)
    @name = name
  end

  def name
    @name
  end

  def number
    @number
  end

  def award_point
    @points +=1
  end

  def points
    @points
  end

  def <=>(other)
    self.points <=> other.points
  end
end