#!/usr/bin/env ruby
if File.exists?("game-list.txt")
  File.open('game-list.txt','r') do |file|
    counter = 1
    file.readlines.each do |line|
      name,system,created,completed = line.chomp.split(/\t/)
      printf("%3d - %s (%s)\n",counter,name,system)
      unless completed.nil?
        printf(" COMPLETE!")
      end
      puts ""
      counter += 1
    end
  end
else
  puts "No games to list - please add a game!"
end

