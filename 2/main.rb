require "csv"

safe_array = []
CSV.foreach("input.txt", col_sep: " ") do |row|
  previous = nil
  unsafe = false
  increase = nil
  row.each do |value|
    if previous == nil
      previous = value
      next
    end

    previous = previous.to_i
    value = value.to_i

    if increase == true && (previous - value) >0
      unsafe = true
    elsif increase == false && (previous - value) < 0
      unsafe = true
    end
    increase = (previous - value) < 0
    
    if !((previous - value).abs > 0 && (previous - value).abs < 4)
      unsafe = true
    end

    previous = value
  end
  
  if unsafe == true
    safe_array << false
  else 
    safe_array << true
  end

end

puts safe_array.count(true)
