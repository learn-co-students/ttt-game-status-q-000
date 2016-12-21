# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
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
  WIN_COMBINATIONS.detect do |combo|
    win_index_1, win_index_2, win_index_3 = combo

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    (position_1 == position_2 && position_2 == position_3 && position_1 != " ")
  end
end

def full?(board)
  board.all? {|element| element != " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  result = won?(board)  

  result.nil? ? result : board[result[0]] 
end
