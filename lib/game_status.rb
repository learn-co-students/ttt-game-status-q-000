# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]

def won?(board)
    WIN_COMBINATIONS.each do |win_combo|
        if (board[win_combo[0]] == 'X' && board[win_combo[1]] == 'X' && board[win_combo[2]] == 'X') || (board[win_combo[0]] == 'O' && board[win_combo[1]] == 'O' && board[win_combo[2]] == 'O')
            return win_combo
        end
    end
    nil
end


def full?(board)
    !board.any? do |pos|
        pos == " "
    end
end


def draw?(board)
    full?(board) && !won?(board)
end


def over?(board)
    won?(board) || draw?(board)
end


def winner(board)
    win_combo = won?(board)
    if win_combo
        board[win_combo[0]] # == 'X' || 'O'
    else
        nil
    end
end