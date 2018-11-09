require 'rspec/given'
require 'pry'
require_relative './tictactoe'

RSpec.describe Tictactoe do

	Given(:board) { [["-","-","-"],["-","-","-"],["-","-","-"]] }
	Given(:tictactoe) {Tictactoe.new(board)}

	context "#set_player" do
		When(:results) { tictactoe.set_player(1) }
		Then { results == "X" }
	end
	
	context "#set_difficulty" do
		When(:results) { tictactoe.set_difficulty(1) }
		Then { results == "easy" }
	end

	context "#change_player" do
		Given(:current_player) { nil }
		When(:results) { tictactoe.change_player(current_player) }
		Then { results == '-' }
	end

	context "#make_a_move" do
		Given(:move_x) { 1 }
		Given(:move_y) { 1 }
		When(:results) { tictactoe.make_a_move(move_x,move_y) }
		Then { results == [0,0] }
	end

	context "#check_valid" do
		Given(:move) { [1,1] }
		When(:results) { tictactoe.check_valid(move) }
		Then { results == true }
	end

	context "#fill_on_board" do
		Given(:move) { [1,1] }
		Given(:current_player) { "X" }
		Given(:fill_board) { [["-","-","-"],["-","X","-"],["-","-","-"]] }
		When(:results) { tictactoe.fill_on_board(move,current_player) }
		Then { results == fill_board }
	end

	context "#change_player" do
		Given(:current_player) { @player_one }
		When(:results) { tictactoe.change_player(@player_one) }
		Then { results == "-" }
	end

	context "#check_win" do
		Given(:win_board) { [["X","-","-"],["-","X","-"],["-","-","X"]] }
		When(:results) { tictactoe.check_win(win_board) }
		Then { results == true }
	end

end