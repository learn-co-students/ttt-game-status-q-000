def win_combo_x? board   # this is super ugly.....
counter = 0
x_array=[]
o_array=[]
board.each do |xor_o|
  if xor_o == 'X'
    x_array << counter  
  elsif xor_o == 'O'
    o_array << counter
  end
  counter += 1
end
return x_array
end
  
  board.all? { |slot| slot == ("X" || "O")}       #does not work ...?
  board.all? { |slot| slot == "X" || "O"}         # will work ... why?  ()???
