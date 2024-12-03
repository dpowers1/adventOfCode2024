text = File.read('C:\Users\dmnck\Programs\advent\2024\3\input.txt')

all_functions = text.scan(/mul\(\d{1,3},\d{1,3}\)/).flatten

total = 0
all_functions.each do |function|
  numbers_to_multiply = function.scan(/\d{1,3}/).map(&:to_i)
  total += numbers_to_multiply[0] * numbers_to_multiply[1]
end

puts total