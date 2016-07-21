board = ["X", "O", "X", "X", "X", "X", "X", "X", "O"]

def won?(board)
  count=[0,1,2,3,4,5,6,7]
  count.any? do |number|
    number>11
  end
end
win=won?(board)
puts "win is #{win}"
win
