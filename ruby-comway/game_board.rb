class GameBoard
  include Enumerable
 
  def initialize(size, initial_life=nil)
    @size = size
    @board = Array.new(size) {Array.new(size) {Cell.new false}}
    seed_board initial_life
  end
 
  def seed_board(life)
    if life.nil?
      # randomly seed board
      each_index.to_a.sample(10).each {|x,y| @board[y][x].live}
    else
      life.each {|x,y| @board[y][x].live}
    end
  end
 
  def each
    @size.times {|x| @size.times {|y| yield @board[y][x] }}
  end
 
  def each_index
    return to_enum(__method__) unless block_given?
    @size.times {|x| @size.times {|y| yield x,y }}
  end
 
  def [](x, y)
    @board[y][x]
  end
 
  def ==(board)
    self.life == board.life
  end
 
  def barren?
    none? {|cell| cell.alive?}
  end
 
  def life
    each_index.select {|x,y| @board[y][x].alive?}
  end
 
  def display(name, generation)
    puts "#{name}: generation #{generation}"
    puts @board.map {|row| row.map {|cell| cell.alive? ? '#' : '.'}.join(' ')}
  end
 
  def apocalypse
    # utility function to entirely clear the game board
    each {|cell| cell.die}
  end
end
