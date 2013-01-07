#!/usr/bin/env ruby
if ARGV.length == 2
	game = ARGV.shift
	system = ARGV.shift

	puts "You entered #{game} for #{system}"

	File.open('game-list.txt','a') do |file|
		file.puts "#{game}\t#{system}\t#{Time.now}"
		puts "Game added!"
	end
else
	puts "Please enter a game and a system"
end
