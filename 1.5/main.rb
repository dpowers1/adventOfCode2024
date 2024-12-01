require "csv"

list1, list2 = [], []
CSV.foreach("input.txt", col_sep: "   ") do |row|
  list1 << row[0].to_i
  list2 << row[1].to_i
end

kvp = {}

list2.each do |value|
  kvp[value] = (kvp[value] || 0) + 1
end

similarity = 0
list1.each_with_index do |value, index|
  similarity = similarity + (value * kvp[value].to_i)
end

puts similarity