#!/usr/bin/env ruby
require_relative 'GameManager.rb'
game = nil
id = 0
gm = GameManager.new
if ARGV.length
  action = ARGV.shift

  if ARGV.length == 1
      id = ARGV.shift.to_i
  elsif ARGV.length == 2
    game = Game.new(ARGV.shift,ARGV.shift)
  end

  if action == "add" && !game.nil?
    gm.add(game)
  elsif action == "remove" && id > 0
    gm.remove(id)
  else
    puts "No game information provided!"
  end
else
  puts "Please provide an action [add/remove]"
end


gm.list
