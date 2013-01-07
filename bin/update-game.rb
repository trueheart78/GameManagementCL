#!/usr/bin/env ruby

game_number = 0
if ARGV.length
  game_number = ARGV.shift.to_i
end

if File.exists?("game-list.txt")
  File.open("game-list.txt","r") do |file|
    File.open("game-list.txt.new","w") do |new_file|
      counter = 1
      file.readlines.each do |line|
        name,system,added,completed = line.chomp.split(/\t/)
        puts "#{counter} #{name} (#{system})"
        if game_number == counter
          new_file.puts("#{name}\t#{system}\t#{added}\t#{Time.now}")
        else
          new_file.puts("#{name}\t#{system}\t#{added}")
        end
        counter += 1
      end
    end
  end
  File.delete("game-list.txt") if File.exists?("game-list.txt")
  File.rename("game-list.txt.new","game-list.txt")
else
  puts "No games exist in the list - please add a game to update"
end
