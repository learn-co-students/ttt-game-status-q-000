# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 3, 6],
[2, 5, 8],
[1, 4, 7],
[0, 4, 8],
[2, 4, 6]
]


def won?(board)
    WIN_COMBINATIONS.detect do |combo|
        board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[2])
    end
end

def full?(board)
    board.all? do |taken|
    taken == "X" || taken == "O"
    end
end

def draw?(board)
    if won?(board).nil?  && full?(board) == true
        return true
    elsif won?(board) == true && full?(board) == true
        return false
    else won?(board) == false && full?(board) == false
        return false
    end
end

def over?(board)
    if won?(board) || draw?(board) || full?(board)
        return true
    else
        return false
        end
end

def winner(board)
    if  won?(board)
        board[won?(board)[2]]
    end
end