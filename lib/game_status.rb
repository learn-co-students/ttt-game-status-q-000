# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
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
board = [" "," "," "]
#board = [" ", "X", "O"]
    def won?(board)
      winner = nil
      WIN_COMBINATIONS.detect do |win_combination|
        win_index_1 = win_combination[0]
        position_1 = board[win_index_1]

        win_index_2 = win_combination[1]
        position_2 = board[win_index_2]

        win_index_3 = win_combination[2]
        position_3 = board[win_index_3]

  if position_1 == "X" && position_2 == "X"  && position_3 == "X"
    winner = win_combination
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    winner = win_combination
    #else position_1 == " " && position_2 == " " && position_3 == " "
    #false
          end
          break if winner
        end
      return winner #psuedo else statement
    end

    def full?(board)
      board.all?{|position| position == "X" || position == "O"}
    end

    def draw?(board)
      full?(board) && !won?(board)
    end

    def over?(board)
      won?(board) || full?(board)
    end

    def winner(board)
      if winning_combo = won?(board)
        board[winning_combo.first]
      end
    end
