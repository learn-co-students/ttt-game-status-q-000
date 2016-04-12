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
  [2,4,6]
]

def won?(board) 
  winner = []
  WIN_COMBINATIONS.each do |win|
    winner_test = [
      board[win[0]],
      board[win[1]],
      board[win[2]]
    ]  

    if winner_test.all? {|marker| marker == "X"} || winner_test.all? {|marker| marker == "O"}
      winner <<  [win[0], win[1], win[2]]
    end        
  end
  return winner[0]  
end

def full?(board)
  board.all? {|position| position != " "}
end

def draw?(board)
  !(won?(board)) && full?(board)  
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)  
  if won?(board)
    winner = board[won?(board)[0]]  
  end
end