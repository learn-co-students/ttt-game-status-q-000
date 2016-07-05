# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
    # Rows combinations
    [0,1,2],
    [3,4,5],
    [6,7,8],
    # Columns combinations
    [0,3,6],
    [1,4,7],
    [2,5,8],
    # Diagonal combinations
    [0,4,8],
    [2,4,6]
]

def won?(board)
    WIN_COMBINATIONS.each do |combo|
        # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
        # grab each index from the win_combination that composes a win
        if board[combo[0]] != " " && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
            return combo
        end
    end
    false
end

def full?(board)
    board.all? do |move|
        move == "X" || move =="O"
    end
end

def draw?(board)
    won?(board) == false  && full?(board)
end

def over?(board)
    draw?(board) || full?(board) || won?(board) != false
end

def winner(board)
    if win = won?(board)
        board[win.first]
    end
end
