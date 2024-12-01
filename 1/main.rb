require "csv"

list1, list2 = [], []
CSV.foreach("input.txt", col_sep: "   ") do |row|
  list1 << row[0].to_i
  list2 << row[1].to_i
end

list1.sort!
list2.sort!
total = 0
list1.each_with_index do |value, index|
  total = total + (value - list2[index]).abs
end

puts total