class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  def reference_board
    puts
    puts "1 | 2 | 3"
    puts "-----------"
    puts "4 | 5 | 6"
    puts "-----------"
    puts "7 | 8 | 9"
    puts "Use the board above as reference"
    puts
  end

  def display_board
    puts
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts
  end

  def input_to_index(input)
    @input = input.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(position)
    @board[position] != " "
  end

  def valid_move?(input)
    (0..8).include?(input) && !position_taken?(input)
  end

  def turn_count
    @board.count {|cell| cell != " "}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please enter a number (1-9):"
    user_input = gets.strip
    index = input_to_index(user_input)

    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end

    display_board
  end

  def won?
    WIN_COMBINATIONS.any? { |combo|
      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return combo
      end
    }
  end

  def full?
    @board.all? {|cell| cell != " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    reference_board
    
    while !over? do
      turn
      #sleep (0.5)
    end

    puts won? ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end
