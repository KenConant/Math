# Calculates Taxi Cab numbers

$taxi_numbers = []
$taxi_file = File.open("taxi_numbers.txt", "w")
$taxi_file.truncate(0)

def taxi_test(testNum)

  combos = 0
  for x in 1..testNum
    x_square = x ** 3
    if x_square > testNum
      break
    end
    for y in 1..testNum
      if y > x
        y_square = y ** 3
        if x_square + y_square > testNum
          break
        end

        if x_square + y_square == testNum
          combos += 1
          # puts "#{x_square}, #{y_square}: #{testNum}, combos: #{combos}"
          break
        end
      end
    end
  end

  if combos >= 2
    $taxi_numbers.push(testNum)
    $taxi_file.write(testNum)
    $taxi_file.write("\n")
    puts "#{testNum}"
  end

end

print "Enter max taxi cab number you would like to find> "
maxNum = $stdin.gets.chomp.to_i

for testNum in 1..maxNum
  taxi_test(testNum)
end

$taxi_file.close
