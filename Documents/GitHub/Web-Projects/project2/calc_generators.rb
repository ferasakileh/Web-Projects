# Various generator functions
module CalcGenerators
  # Function that generate odd numbers within a specified range and saves to a file
  # @param min [Integer] The lower limit to which the even numbers are generated from
  # @param max [Integer] The upper limit to which the even numbers are generated to
  def generate_even_numbers(min, max)
    min = min.to_i
    max= max.to_i
    evens = (min..max).select(&:even?)
    File.open("even_numbers.txt", 'w') do |file|
      evens.each { |even| file.puts(even) }
    end
  end

  # Function that generate odd numbers within a specified range and saves to a file
  # @param min [Integer] The lower limit to which the odd numbers are generated from
  # @param max [Integer] The upper limit to which the odd numbers are generated to
  def generate_odd_numbers(min, max)
    min = min.to_i
    max= max.to_i
    odds = (min..max).select(&:odd?)
    File.open("odd_numbers.txt", 'w') do |file|
      odds.each { |odd| file.puts(odd) }
    end
  end

  # Function that generate square within a specified range and saves to a file
  # @param min [Integer] The lower limit to which the square numbers are generated from
  # @param max [Integer] The upper limit to which the square numbers are generated to
  def generate_squares(min,max)
    min = min.to_i
    max= max.to_i
    array = *(min..max)
    squares = array.map {|num| num ** 2}
    File.open('squares.txt', 'w') do |file|
      squares.each {|square| file.puts(square)}
    end
  end

  # Generate all prime numbers less than a given number and save them to a file
  # @param max_num [Integer] The upper limit to which the prime numbers are generated to
  # @return [Array<Integer>] The generated prime numbers
  def generate_primes(max_num)
    primes = []
    for num in 2...max_num
      primes << num if is_prime(num)
    end
    File.open("primes_#{max_num}.txt", 'w') do |file|
      primes.each { |prime| file.puts(prime) }
    end
  end

   # Generates Fibonacci sequence up to a limit and writes it to a file
  # @param limit [Integer] The limit to which to calculate the sequence up to
  # @return [Array<Integer>] The generated Fibonacci sequence up to the specified limit
  def fibonacci(limit)
    # start sequence
    sequence = [1, 1]
    sum = 2
    # run loop until limit has been reached
    while sum < limit  
      # add next value to array and update sum 
      sequence.push(sum)
      sum = sum + sequence[sequence.length - 2]
    end
    # write to text file
    file = File.new("fibonacci_#{limit}.txt", "w")
    file.puts(sequence)
    file.close
    # return sequence
    sequence
  end

    # Determine if num is a prime number
  # @param num [Integer] A number to determine whether it is prime or not
  # @return [Boolean] True if prime, false if not prime
  def is_prime(num)
    return false if num < 2
    for i in 2..(num - 1)
      return false if num % i == 0
    end
    true
  end

end