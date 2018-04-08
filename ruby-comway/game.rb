require_relative "./game_board.rb"
require_relative "./cell.rb"

class Game
  def initialize(name, size, generations, initial_life=nil)
    @size = size
    @board = GameBoard.new size, initial_life
    @board.display name, 0
 
    reason = generations.times do |gen|
      new_board = evolve
      new_board.display name, gen+1
      break :all_dead if new_board.barren?
      break :static   if @board == new_board
      @board = new_board
    end
 
    case reason
    when :all_dead  then puts "No more life."
    when :static    then puts "No movement."
    else                 puts "Specified lifetime ended."
    end
    puts
  end
 
  def evolve
    life = @board.each_index.select {|i,j| cell_fate(i,j)}
    GameBoard.new @size, life
  end
 
  def cell_fate(i, j)
    left_right = [0, i-1].max .. [i+1, @size-1].min
    top_bottom = [0, j-1].max .. [j+1, @size-1].min
    sum = 0
    for x in left_right
      for y in top_bottom
        sum += @board[x,y].value if x != i or y != j
      end
    end
    sum == 3 or (sum == 2 and @board[i,j].alive?)
  end
end
