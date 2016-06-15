nested_students[2] << "Class President" #appends to array[2] in nested array

# iterates over nested_students array. 1 level
nested_students.each do |student_array|
  # #inspect returns a human-readable representation
  # of the array
  puts student_array.inspect
end

#output is arrays
["Mike", "Grade 10", "A average"]
["Tim", "Grade 10", "C average"]
["Monique", "Grade 11", "B average", "Class President"]

#iterates to two levels in the array
nested_students.each do |student_array|
  student_array.each do |student_detail|
    puts student_detail
  end
end

#output
Mike
Grade 10
A average
Tim
Grade 10
C average
Monique
Grade 11
B average
Class President

music_library.each do |artist_array|
  artist_array.each do |artist_element|
    # we are inside the first level of the array
    # artist_element = ["Adele", ["19", ["Day Dreamer", "Best For Last"]], ["21", ["Rollin' In The Deep", "Rumor Has It"]]]

    if artist_element.class != Array
      puts "Artist: #{artist_element}"
    else
      artist_element.each do |album_element|
        # we are inside the second level of the array,
        # album_element = ["19", ["Day Dreamer", "Best For Last"]]
        if album_element.class != Array
          puts "Album: #{album_element}"
        else
          album_element.each do |song_element|
            # we are inside the third level of the array
            # song_element = "Day Dreamer"
            puts "Song: #{song_element}"
          end
        end
      end
    end
  end
end

#all?
all_odd = [1,2,3].all? do |number|
  number.odd? # Will evaluate to true for 1, false for 2, true for 3
end #=> false
all_odd #=> false

#none?
[1,3].none?{|i| i.even?} #=> true

#any?
[1,2,100].any?{|i| i > 99} #=> true

#include?
the_numbers = [4,8,15,16,23,42]
the_numbers.include?(42)   #=> true
the_numbers.include?(6)   #=> false

#each
matches = []
[1,2,3,4,5].each do |i|
  matches << i if i.even? # add i to the matches array if it is even
end #=> [1,2,3,4,5]
matches #=> [2,4]

#select
[1,2,3,4,5].select do |number|
  number.even?
end #=> [2,4]

#detect
[1,2,3,4].detect{|i| i.even?} #=> 2
[1,2,3,4].detect{|i| i.is_a?(String)} #=> nil

#reject
[1,2].reject{|i| i.even?} #=> [1]
