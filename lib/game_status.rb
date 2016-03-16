# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    combination_result = []
    combination.each do |index|
      combination_result << board[index]
    end

    return combination if combination_result.all?{ |cell| cell == 'X' } ||
                                 combination_result.all?{ |cell| cell == 'O' }
  end

  false
end

def full?(board)
  return true if board.none?{ |cell| cell == " " }
  false
end

def draw?(board)
  return true if full?(board) && !won?(board)
  false
end

def over?(board)
  return true if draw?(board) || won?(board)
  false
end

def winner(board)
  winner_combo = won?(board)

  return board[winner_combo[0]] unless winner_combo == false
  nil
end












