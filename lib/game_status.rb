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
  tests = WIN_COMBINATIONS
  token = "X"
  tests.each do |i|
    if tests[i][0] == token && tests[i][1] == token && tests[i][2] == token
      return tests[i]
    end
  end
end


