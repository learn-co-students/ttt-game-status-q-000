# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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
  [2,4,6]
]

def won?(board)
  game = false
  WIN_COMBINATIONS.each do|win_comb|
    if !game
      if win_comb.all? {|win| board[win] == "X"} || win_comb.all? {|win| board[win] == "O"}
        game = win_comb
      end
    end
  end
  game
end


def full?(board)
    if board.any?{|space| space == " "} == true
      false
    else
      true
    end
end


def draw?(board)
  if won?(board) == false
    true
  else
    false
  end
end

def over?(board)
  if full?(board) == false
    false
  else
    true
end
end

def winner(board)
    if won?(board) != false
      winner = board[won?(board)[0]]
    else
      nil
    end
end
