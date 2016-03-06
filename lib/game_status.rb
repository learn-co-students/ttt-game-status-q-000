# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [
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
  winning = WIN_COMBINATIONS.select do |combo_array|
    pos_1 = combo_array[0]
    pos_2 = combo_array[1]
    pos_3 = combo_array[2]

    space_1 = board[pos_1]
    space_2 = board[pos_2]
    space_3 = board[pos_3]

    (space_1 == 'X' && space_2 == 'X' && space_3=='X') || (space_1 == 'O' && space_2 == 'O' && space_3=='O')
  end
  winning == [] ? false : winning[0]
end


def full?(board)
  all_full = board.all? do | space |
    space == 'X' || space == 'O'
  end
  all_full
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || draw?(board) || won?(board)
end

def winner(board)
  win_array = won?(board)
  win_array ? board[win_array[0]] : nil
end