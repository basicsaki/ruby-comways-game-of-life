require "spec_helper"

describe GameBoard do

	before :each do 
		@board = GameBoard.new 50,[[1,0],[1,1],[1,2],[2,1]]
	end

	describe "#new" do
		it "Should seed a barren board if no initial life is given"  do
			@board = GameBoard.new 50,[]	
			expect(@board.barren?).to be_truthy
		end

		it "Should seed a non barren board"  do	
			expect(@board.life).not_to be_empty
		end

	end

	describe "#new #[](x,y)" do
		it "should have a living cell in position" do
			expect(@board.[](1, 0).alive?).to be_truthy
		end

		it "should not have a living cell in any random position" do
			expect(@board.[](1, 5).alive?).not_to be_truthy
		end
	end

	describe "#apocalypse" do
		it "should kill all living cells" do
			@board.apocalypse
			expect(@board.barren?).to be_truthy
		end
	end

end

