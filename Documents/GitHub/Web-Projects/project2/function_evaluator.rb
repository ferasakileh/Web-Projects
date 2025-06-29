require_relative 'methods'

# A class responsible evaluating mathematical functions
class FunctionEvaluator
  include CalculatorMethods
  # Constants
  PI = Math::PI

  # Initializes function, base, argument variables that will be used to capture the current tokens
  # @param function [String] The name of the function to be evaluated 
  # @param base [Float, Integer] The base value for the function evaluation
  # @param argument [Float, Integer, nil] An optional argument for functions that require more than one parameter 
  # @return [FunctionEvaluator] A new instance of FunctionEvaluator
  def initialize(function, base, argument = nil)
    @function = function
    @base = base
    @argument = argument
  end

  # Executes appropriate function based on the current function token
  # @return [Float, Integer] The result of the function evaluation
  # @raise [RuntimeError] If the function name is unknown or if the parameters for the function are invalid
  def evaluate
    case @function
    when 'to_binary'
      decimal_to_binary(@base)
    when 'to_octal'
      decimal_to_octal(@base)
    when 'to_hex'
      decimal_to_hex(@base)
    when 'sin'
      sine(@base) # Takes in radians
    when 'cos'
      cosine(@base) # Takes in radians
    when 'tan'
      tangent(@base) # Takes in radians
    when '√'
      square_root(@base)
    when '∛'
      cube_root(@base)
    when 'temp'
      fToC(@base)
    when 'absolute'
      absolute(@base)
    when 'primes'
      generate_primes(@base)
    when 'factorial'
      factorial(@base)
    when 'log'
      # Ensure base and argument are valid for log calculation
      if @base <= 0 || @base == 1 || @argument <= 0
        raise "Base and argument must be positive, and base cannot be 1 for log function"
      end
      log(@base, @argument) 
    when 'exponent'
      exponent(@base, @argument) 
    when 'percentage'
      percentage(@base, @argument)
    when 'odds'
      generate_odd_numbers(@base, @argument)
    when 'evens'
      generate_even_numbers(@base, @argument)
    when 'squares'
      generate_squares(@base, @argument)
    when 'isPrime'
      is_prime(@base)
    else
      raise "Unknown function: #{@function}"
    end
  end
end