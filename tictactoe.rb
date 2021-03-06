# Tic Tac Toe Ruby

# Break down of the game

# First you need to start a new game and initialize the board, the player chooses X or O
# Choose the difficulty setting for ai or if they want to play PvP
####### PvP First ########
# Set the starting player to the chosen X or O
# Start the game to play
# ------------------------------------------
# Take the input from the player [X,Y] value for the position on the board
# Check if the chosen space is taken, if it is, ask the user to input another position
# If the position is not taken, move on to next step
# Fill in the position on the board with the current users chosen marker
# Perform a win check to see if the user has won
# If the user has not won, move on to the next players turn
# ------------------------------------------
# Repeat until a user has won


class Tictactoe

	def initialize(board)
		@board = board
		@game_state = true
		@difficulty = "-"
		@player_one = "-"
		@player_two = "-"
	end


	def play_game!
		# Start with the current player being nil
		current_player = nil
		# Print the main menu
		main_menu
		# Ask player to choose to be X or O
		set_player
		# Ask player to choose the difficulty, easy, hard or pvp
		set_difficulty
		# Set the current player to the chosen X or O
		current_player = change_player(current_player)
		# Loop until the game is won!
		while @game_state == true
			# Print out the starting board
			print_board
			# Ask the player to pick a move
			current_move = make_a_move

			if check_valid(current_move) == true
				fill_on_board(current_move, current_player)
				winner = current_player
				current_player = change_player(current_player)
				if check_win(@board) == true
					print_board
					puts "#{winner} wins!"
					return @game_state = false 
				end
			else
				puts '--------- Invalid Move! --------'
				puts '---------- Pick Again! ---------'	
				puts '--------------------------------'
			end
				

		end

	end

	# Prints out the main menu on starting the game
	def main_menu
		puts '################################'
		puts '######### Tic Tac Toe ##########'
		puts '################################'
		puts '================================'
		puts '== Choose your weapon warrior =='
		puts '================================'
		puts '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'
		puts '^^^^^^ Type Your Choice: ^^^^^^^'
		puts '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'
		puts '$$$$$$$$$$$ 1. "X" $$$$$$$$$$$$$'
		puts '$$$$$$$$$$$ 2. "O" $$$$$$$$$$$$$'
		puts '--------------------------------'
	end

	# Take the input for the choice of player
	def set_player(choice=nil)

		# until choice == 1 || choice == 2

			choice = gets.chomp.to_i if !choice
			case

				when choice == 1

					 @player_one = "X"
					 @player_two = "O"

				when choice == 2

					 @player_one = "O"
					 @player_two = "X"

				when choice != 1 || choice != 2

					puts '-------- Invalid Choice! -------'
					puts '---------- Pick Again! ---------'	
					puts '--------------------------------'
			end
		# end

		puts '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'
		puts "$$$$$$$ Player One #{@player_one} $$$$$$$"
		puts "$$$$$$$ Player Two #{@player_two} $$$$$$$"

		return @player_one

	end

	# Take the input for the choice of difficulty

	def set_difficulty(choice=nil)

		puts '================================'
		puts '==== Choose your difficulty ===='
		puts '================================'
		puts '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'
		puts '^^^^^^ Type Your Choice: ^^^^^^^'
		puts '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'
		puts '$$$$$$$$$$$ 1. easy $$$$$$$$$$$$'
		puts '$$$$$$$$$$$ 2. hard $$$$$$$$$$$$'
		puts '$$$$$$$$$$$ 3. pvp  $$$$$$$$$$$$'
		puts '--------------------------------'

		choice = gets.chomp.to_i if !choice

		case 

			when choice == 1
				@difficulty = "easy"
			when choice == 2
				@difficulty = "hard"
			when choice == 3
				@difficulty = "pvp"
			when choice != 1 || choice != 2 || choice != 3

				puts '-------- Invalid Choice! -------'
				puts '---------- Pick Again! ---------'	
				puts '--------------------------------'

		end

		return @difficulty

	end

	# Change or set the initial player
	def change_player(player)

		if player == nil || player == @player_two
			return @player_one
		elsif player == @player_one
			return @player_two
		end

	end

	# Print out the current_board state
	def print_board

		@board.each_with_index do |row, i|

			row.each do |space|

				print "|#{space}|"

			end

			if i == 2
				puts ""
			else
				puts ""
				puts "---------"
			end

		end

	end

	# Take the user input to make a move
	def make_a_move(x=nil,y=nil)

		puts '================================'
		puts '======= Choose your move! ======'
		puts '================================'
		puts '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'
		puts '^^^^^^ Type Your Choice: ^^^^^^^'
		puts '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'
		puts '$$$$$$$$$ Row 1,2 or 3 $$$$$$$$$'

		x = gets.chomp.to_i if !x

		puts '$$$$$$$ Column 1,2 or 3 $$$$$$$$'

		y = gets.chomp.to_i if !y

		puts '--------------------------------'

		move = [x-1,y-1]

		return move

	end

	# Check the move given is valid
	def check_valid(move)

		if @board[move[0]][move[1]] != "-"
			return false
		else
			return true
		end

	end

	# Fill out the current valid move on the board
	def fill_on_board(move, player)

		@board[move[0]][move[1]] = player

		return @board

	end

	# Check for a winning combination
	def check_win(b)

		board_columns = b.transpose
		board_diagonals = [[b[0][0],b[1][1],b[2][2]],[b[0][2],b[1][1],b[2][0]]]

		case

		when b.include?(["X","X","X"]) || b.include?(["O","O","O"])
			return true
		when board_diagonals.include?(["X","X","X"]) || board_diagonals.include?(["O","O","O"])
			return true
		when board_columns.include?(["X","X","X"]) || board_columns.include?(["O","O","O"])
			return true
		end

	end

end

################ Driver Code ###################
new_board = [["-","-","-"],["-","-","-"],["-","-","-"]]
tictactoe = Tictactoe.new(new_board)
tictactoe.play_game!