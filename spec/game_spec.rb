require "spec_helper"

describe Game do

	before :each do 
#		@output = capture(:stdout) do
      		@game = Game.new "output",5,1,[[1,0],[1,1],[1,2],[2,1]]
	end

	describe "#new" do
		it "Should init a new game board on init"  do
			expect(@game.board.life).not_to be_empty
		end
	end

	describe "#evolve" do
		it "should have a cell alive if it has 2 neighours" do
			@board = @game.evolve
			expect(@game.board.[](1, 0).alive?).to be_truthy
		end

		it "should change the cell to be dead if it has less than 2 neighrbours" do
			@board = @game.evolve
			expect(@game.board.[](0, 0).alive?).not_to be_truthy
		end
	end

end

