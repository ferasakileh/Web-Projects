# Define Constants
TOKEN_PATTERN2 = /
  \d*\.\d+ |   # Decimal numbers
  \d+ |        # Integer numbers
  [\+\-\*\/\%] | # Operators
  \(|\)|       # Parentheses
  √|∛|log|,|sin|cos|tan|exponent|percentage|to_binary|to_octal|to_hex|factorial|temp|odds|evens|squares|primes|is_prime|q|π # Functions
/x
# A class responsible for tokenizing an input of strings
class Tokenizer
  
  # Initialized Tokenizer with input string
  # @param input [String] The input string to be tokenized.
  # @return [Tokenizer] A new instance of Tokenizer.
  def initialize(input)
    #@tokens = tokenize(input)
    #@current_token = @tokens.shift
    @input = input
  end

  # Tokenizer function breaks the input into tokens
  # @return [Array<String>] An array of tokens extracted from the input string.
  def tokenize
    @input.scan(TOKEN_PATTERN2)
  end
end