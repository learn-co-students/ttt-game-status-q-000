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
    [6,4,2]
]

def won?(board)
    WIN_COMBINATIONS.each do |combo|
        entries = board[combo[0]] + board[combo[1]] + board[combo[2]]
        if entries == "XXX" || entries == "OOO"
            return combo
        end
    end
    false
end

def full?(board)
    board.all? do |entry|
        entry == "X" || entry == "O"
    end
end

def draw?(board)
    full?(board) && !won?(board)
end

def over?(board)
    won?(board) || draw?(board)
end

def winner(board)
    winning_entry = won?(board)
    if winning_entry
        return board[winning_entry[0]]
    end
end
