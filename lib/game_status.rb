# Helper Method


def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS= [
    [0,1,2],  #top row
    [3,4,5], #middle row
    [6,7,8],  #bottom row
    [0,3,6],  #left column
    [1,4,7],  #middle column
    [2,5,8],  #right column
    [0,4,8],  #diagonal 1
    [6,4,2]   #diagonal 2
]

board = ["O", " ", " ", "O", " ", " ", "O", " ", " "]


def won?(board)
  $winner = nil
  returnable = []
  WIN_COMBINATIONS.each do |win_combo|
        if board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X"
          $winner = "X"
          returnable = win_combo
          break
        elsif board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
          $winner = "O"
          returnable = win_combo
          break
          else
          returnable = false
        end
  end
  returnable
end

def full?(board)
  full = board.include?(" ")
  !full
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  end
end

def winner(board)
  over?(board)
  $winner
end


won?(board)