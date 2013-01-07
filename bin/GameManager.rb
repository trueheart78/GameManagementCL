class GameManager
  public
  def verify_file
    File.open("game-list.txt", "w") {} unless File.exists?('game-list.txt')
  end
  def list
    self.verify_file
    File.open('game-list.txt','r') do |file|
    	counter = 1
      puts "  ------ Game List ------"
    	file.readlines.each do |line|
    		name,system,created,completed = line.chomp.split(/\t/)
    		printf("%3d: %s (%s)",counter,name,system)
    		unless completed.nil?
    			printf(" -- COMPLETE!")
    		end
    		puts ""
    		counter += 1
    	end
    end
  end
  def add(game)
    	print "->You entered #{game.name} for #{game.system}"
      self.verify_file
    	File.open('game-list.txt','a') do |file|
    		file.puts "#{game.name}\t#{game.system}\t#{Time.now}"
    		print " - game added!"
      end
      print "\n"
  end

  def remove(number)
    puts "->Removing game id #{number}"
    self.verify_file
    File.open('game-list.txt','r') do |file|
      File.open('game-list.txt.new','w') do |new_file|
        counter = 1
        file.readlines.each do |line|
          name,system,created,completed = line.chomp.split(/\t/)
          if number != counter
            new_file.puts("#{name}\t#{system}\t#{created}\t#{Time.now}")
          end
          counter += 1
        end
      end
    end
    game-list.txt
    File.delete("game-list.txt") if File.exists?("game-list.txt")
    File.rename("game-list.txt.new","game-list.txt")
  end

  def complete(id)
    puts "->Completing game id #{id}"
    #finish this method
  end

end

class Game
  attr_accessor :name, :system, :added, :completed

  def initialize(name, system, added="", completed="")
    @name = name
    @system = system
    @added = added
    @completed = completed
  end

  def to_s
    "#{@name} (#{@system}) was added on #{added}"
  end
end