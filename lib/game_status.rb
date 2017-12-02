# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

board = []
def won?(board)
  WIN_COMBINATIONS.each do |wc|
    p1 = board[wc[0]]
    p2 = board[wc[1]]
    p3 = board[wc[2]]

    if (p1 == "X" && p2 == "X" && p3 == "X") || (p1 == "O" && p2 == "O" && p3 == "O")
      return wc
    end
  end
  return false
end


def full?(board)
  board.none?{|position| position == " "}
end

def draw?(board)
  !(won?(board)) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
won = won?(board)
  if won.class == Array
  return board[won[0]]
end
end