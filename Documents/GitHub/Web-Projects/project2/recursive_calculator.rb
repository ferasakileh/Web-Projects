require_relative 'tokenizer'
require_relative 'parser'

# A class that uses the tokenizer and parser to perform operations
class RecursiveCalculator
  # Tokenizes and parses inputs
  # @param input [String] The mathematical expression to be evaluated
  # @return [RecursiveCalculator] A new instance of RecursiveCalculator
  def initialize(input)
    @tokens = Tokenizer.new(input).tokenize
    @parser = Parser.new(@tokens)
  end

  # Parser evaluates the expression
  # @return [Float, Integer] The result of the evaluated expression
  def evaluate
    @parser.parse_expr
  end
end