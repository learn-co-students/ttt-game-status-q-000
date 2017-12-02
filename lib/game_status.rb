# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
]

def won?(board)
    for win_combination in WIN_COMBINATIONS do
        if ((board[win_combination[0]] == board[win_combination[1]]) && (board[win_combination[1]] == board[win_combination[2]])) && board[win_combination[0]] != " "
            return win_combination
        end
    end
    return false
end

def full?(board)
    !board.include?(" ")
end

def draw?(board)
    full?(board) && !won?(board)
end

def over?(board)
    full?(board) || draw?(board) || won?(board)
end

def winner(board)
    if won?(board)
        return board[won?(board)[0]]
    else
        return nil
    end
end
