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
        win = WIN_COMBINATIONS.select do |combo|
        board[combo[0]] + board[combo[1]] + board[combo[2]] == "OOO" || board[combo[0]] + board[combo[1]] + board[combo[2]] == "XXX"
        end
    if win.length == 1
    return win[0]
    else
    return nil
    end
end

def full?(board)
    return board.all?{|element| element == "X" || element == "O"}
end

def draw?(board)
    if full?(board) == true &&  won?(board) == nil
        return true
    else
        return false
    end
end

def over?(board)
    if draw?(board) == true || full?(board) == true || won?(board) == true
        return true
    else
        return false
    end
end

def winner(board)
   if  won?(board) != nil
        return board[won?(board)[0]]
   end
    return nil
end

