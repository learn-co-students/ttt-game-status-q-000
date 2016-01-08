# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
#Across
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
#Down
[0, 3, 6],
[1, 4, 7],
[2, 5, 8],
#Diagonal
[0, 4, 8],
[2, 4, 6]
]

def won?
  WIN_COMBINATIONS.each do |win_combo|

end
