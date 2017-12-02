# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6]
  ]

def won?(board)
  winning = []
  if board.all?{|position| position == ' '}
    false
  else
    WIN_COMBINATIONS.each do |win_index|
      if (board[win_index[0]] == 'X' && board[win_index[1]] == 'X' && board[win_index[2]] == 'X') || (board[win_index[0]] == 'O' && board[win_index[1]] == 'O' && board[win_index[2]] == 'O')
        winning << win_index[0]
        winning << win_index[1]
        winning << win_index[2]
      end
    end
  end
  if winning != []
    return winning
  end
end

def full?(board)
  if board.all?{|position| position == 'X' || position == 'O'}
    true
  else
    false
  end
end

def draw?(board)
  if won?(board).kind_of?(Array)
    false
  elsif full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  if won?(board).kind_of?(Array)
    true
  elsif draw?(board) == true
    true
  else
    false
  end
end

def winner(board)
  if won?(board).kind_of?(Array)
    board[won?(board)[0]]
  end
end
