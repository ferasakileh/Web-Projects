# Various math functions
module CalcMath
  # Find the absolute value of a given number
  # @param a [Integer] The number to have its absolute value calculates
  # @return [Integer] The absolute value of the input number
  def absolute(a)
    result=a
    if a < 0
      result = -a
    end
    result
  end

  # Returns the factorial of a non-negative integer n
  # @param n [Integer] The number for which the factorial to be calculated
  # @return [Integer, Float::INFINITY] The factorial of the input or Float::INFINITY if n is negative
  def factorial(n)
    return Float::INFINITY if n<0
    result=1
    for i in 1..n
      result *=i
    end
    result
  end

  # Calculates what percentage a is of b.
  # @param a [Numeric] The numerator
  # @param b [Numeric] The denomenator
  # @return [Float, Float::INFINITY] The percent of 'a' with respect to 'b' or Float::INFINITY if 'b' is 0
  def percentage(a,b)
    if b == 0
      result = Float::INFINITY
    else
      result=(a*1.0)/b * 100
    end
    result
  end

  # Calculate the logatrithm of a number wuth a specified base
  # @param base [Numeric] The base of the log
  # @param a [Numeric] The number to find the log of
  # @return [Float] The log of 'a' given base 'base'.
  def log(base, a)
    Math.log(a) / Math.log(base)
  end

  # Calculate the square root of a number
  # @param num [Numeric] The number to find the square root of
  # @return [Float, Float::INFINITY] The square root of the input
  # or FLOAT::INFINITY if the number was negative 
  def square_root(num)
    if num<0
      return Float::INFINITY
    else
      return Math.sqrt(num)
    end
  end

  # Calculate the cube root of a number
  # @param num [Numeric] The number to find the cube root of
  # @return [Float, Float::INFINITY] The cube root of the input
  # or FLOAT::INFINITY if the number was negative 
  def cube_root(num)
    return num ** (1.0/3) # this raises the number to 1/3
  end

  # Calculate the exponent given a base and power 
  # @param a [Numeric] The base of the exponent
  # @param b [Numeric] The power of the exponent
  # @return [Float] The cube root of the input
  def exponent(a, b)
    if a == 0 && b == 0
      # Conventionally, 0^0 is often treated as 1, but this can be context-dependent.
      return 1
    elsif b < 0
      # Handle negative exponents
      return 1.0 / exponent(a, -b)
    else
      result = 1
      b.times do
        result *= a
      end
      return result
    end
  end
end