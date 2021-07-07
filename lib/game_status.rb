# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # first column
  [1,4,7], # second column
  [2,5,8], # third column
  [0,4,8], # diagonal left
  [2,4,6] # diagonal right
]

def full?(board)
        board.all?{|full| full == "X" || full == "O"}
        end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    board[win_combination[0]] == board[win_combination[1]] &&
    board[win_combination[1]] == board[win_combination[2]] &&
    position_taken?(board, win_combination[0])
  end
end

def draw?(board)

        !won?(board) && full?(board)

end

def over?(board)

        draw?(board) || won?(board)

end

def winner(board)

     if   winning_combination = won?(board)
    board[winning_combination.first]
     end
end


