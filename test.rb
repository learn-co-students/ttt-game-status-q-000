def full?(board)
  board.each do |ind|
    if ind ==  " " || ind == nil
      return false
    end
  end
  true
end

  board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
  full?(board)
