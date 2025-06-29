# Various stats functions
module CalcStatistics
  # Calculates the mean of an array of numbers
  # @param data [Array<Numeric>] An array of numbers to calculate the mean of
  # @return [Float] The mean of the array inputted
  def mean(data)
    return nil if data.empty? # Return nil if the array is empty
  
    sum = data.reduce(0, :+)
    mean = sum.to_f / data.size
    mean
  end
  

  # Finds the maximum value of an array of numbers
  # @param data [Array<Numeric>] An array of numbers to find the maximum of
  # @return [Float] The maximum value of the array inputted
  def maximum(data) 
    # initialize max to first value of array
    max = data[0]

    # set value in array to max if greater than current max
    data.each{ |val|
      if val > max
        max = val
      end
    }
    # return max
    max
  end

  # Finds the median value of an array of numbers
  # @param data [Array<Numeric>] An array of numbers to find the median of
  # @return [Float, Numeric] The median value of the array inputted
  def median(data)
    sorted = data.sort
    puts "#{sorted}"
    length = sorted.length
    if length % 2 == 1
      sorted[length / 2] # odd length, return middle element
    else
      mid1 = sorted[length / 2 - 1]
      mid2 = sorted[length / 2]
      (mid1 + mid2) / 2.0 # even length, return average of middle elements
    end
  end

    # Function that returns the smallest value from a set of numbers
  # @param numbers [Array<Numeric>] The array of numbers to be checked
  # @return [Numeric] The smallest number in the array
  def find_smallest(numbers)
    smallest = numbers[0] # assume the first number is the smallest

    numbers.each do |num|
      if num < smallest
        smallest = num
      end
    end
    return smallest
  end

    # Function that finds the mode of a dataset
  # @param data [Array<Numeric>] An array of numbers to find the mode of
  # @return [Float, Numeric] The mode value of the array inputted
  def mode(data)
    frequency = Hash.new(0)
    max_frequency = 0
    mode = nil

    data.each do |num|
      frequency[num] += 1
      if frequency[num] > max_frequency
        max_frequency = frequency[num]
        mode = num
      end
    end

    mode
  end

end