# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =
[
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

   WIN_COMBINATIONS.each do |combo|
      if board[combo[0]] != " " && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
        return combo
      end
   end
   false
end

def full?(board)
  board.none? { |index| index == " " }
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  if won?(board) != false || draw?(board) == true
    true
  else
    false
  end
end

def winner(board)
  win_index = won?(board)
  if win_index == false
    nil
  elsif board[win_index[0]] == "X"
    "X"
  elsif board[win_index[0]] == "O"
    "O"
  end
end
