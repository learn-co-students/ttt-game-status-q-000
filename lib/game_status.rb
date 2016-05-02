# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [#indexes that compose top row win
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,4,8], # diagonal 
  [2,4,6], # diagonal 
  [0,3,6], # left vertical
  [1,4,7], # middle vertical
  [2,5,8], # right vertical 
]

  

#def full?


#def draw?


#def over?


#def winner