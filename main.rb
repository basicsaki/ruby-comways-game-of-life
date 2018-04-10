require "./ruby-comway/game.rb"
if ARGV[0]=="--help"
	puts "The run command expects the following paramters\n
	ruby main.rb matrix_values,max number of iterations,array of alive cell positions
	eg 
	ruby main.rb 50 50 [[5,0],[5,1],[5,2],[2,1]]
	"
else	
	Game.new "output", ARGV[0].nil? ? 50 : ARGV[0].to_i, ARGV[1].nil? ? 50 : ARGV[1].to_i, ARGV[2].nil? ? [[1,0],[1,1],[1,2],[2,1]] : eval(ARGV[2])
end
