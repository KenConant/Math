# Calculate all anti-prime numbers
# aka Composite numbers

$antiprime_list = []
$topFactors = 0
$antiprime_file = File.open("antiprime.txt", "w")
$antiprime_file.truncate(0)

def antiprime(testNum)
  factors = 0
  for x in 1..testNum
    if testNum % x == 0
      factors += 1
    end
  end

  if factors > $topFactors
    $topFactors = factors
    $antiprime_list.push(testNum)
    $antiprime_file.write(testNum)
    $antiprime_file.write("\n")
    puts "#{testNum}"
  end
end

print "Enter max anti-prime number you would like to find> "
maxNum = $stdin.gets.chomp.to_i

for testNum in 1..maxNum
  antiprime(testNum)
end

$antiprime_file.close
