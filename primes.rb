# Find all prime numbers between 2 and 1000
$primeList = []
$primeFile = File.open("primes.txt", "w")
$primeFile.truncate(0)

# Test module to find prime numbers
def prime(testNum)
  # Loop through the known prime numbers already calculated
  # All numbers can be broken down to prime factors
  for known in $primeList
    # Break the for loop after the known prime is greater than half test
    if known > testNum / 2
      break
    end

    # Is the test number divisible by this known prime?
    # If so the number is not prime, exit function
    if testNum % known == 0
      return
    end
  end

  # If we get to this point the number is prime
  $primeList.push(testNum)
  $primeFile.write(testNum)
  $primeFile.write("\n")
  puts "#{testNum}"
end

print "Enter max prime number you would like to find> "
maxNum = $stdin.gets.chomp.to_i

for testNum in 2..maxNum
  prime(testNum)
end

$primeFile.close
