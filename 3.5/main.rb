text = File.read('C:\Users\dmnck\Programs\advent\2024\3\input.txt')

regexp = /(mul\(\d{1,3},\d{1,3}\)|do\(\)|don't\(\))/
all_functions = text.scan(regexp).flatten

total = 0
commence_multiplication = true
all_functions.each do |function|
  if function == "don't()"
    commence_multiplication = false
  elsif function == "do()"
    commence_multiplication = true
  else
    if commence_multiplication
      numbers_to_multiply = function.scan(/\d{1,3}/).map(&:to_i)
      total += numbers_to_multiply[0] * numbers_to_multiply[1]
    end
  end
end

puts total
