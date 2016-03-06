# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8],
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    win_combo.each do |taken_cells|
      if taken_cells == position_taken?(board, location)
        if taken_cells == "X"
          return win_combo
          elsif taken_cells == "O"
          return win_combo
          else
          return false
        end
      end
    end
  end
end