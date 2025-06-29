# Include test interface
require 'minitest/autorun'
# Include file to be tested
require_relative 'tokenizer'

# Class tests expected tokenizer output to actual tokenizer output
class TokenizerTest < Minitest::Test
  # Test cases for tokenizing various valid arithmetic expressions
  def test_valid_tokenization
    tokenizer = Tokenizer.new("5 + 3")
    assert_equal ["5", "+", "3"], tokenizer.tokenize

    tokenizer = Tokenizer.new("10 - 2 * 3")
    assert_equal ["10", "-", "2", "*", "3"], tokenizer.tokenize

    tokenizer = Tokenizer.new("(8 / 4) + 7")
    assert_equal ["(", "8", "/", "4", ")", "+", "7"], tokenizer.tokenize

    tokenizer = Tokenizer.new("100 % 3")
    assert_equal ["100", "%", "3"], tokenizer.tokenize

    tokenizer = Tokenizer.new("2 + 3 * (4 - 1)")
    assert_equal ["2", "+", "3", "*", "(", "4", "-", "1", ")"], tokenizer.tokenize

    tokenizer = Tokenizer.new("0 - 0")
    assert_equal ["0", "-", "0"], tokenizer.tokenize

    tokenizer = Tokenizer.new("sin(π / 2)")
    assert_equal ["sin", "(", "π", "/", "2", ")"], tokenizer.tokenize

    tokenizer = Tokenizer.new("cos(π) * 2")
    assert_equal ["cos", "(", "π", ")", "*", "2"], tokenizer.tokenize

    tokenizer = Tokenizer.new("factorial(5)")
    assert_equal ["factorial", "(", "5", ")"], tokenizer.tokenize

    tokenizer = Tokenizer.new("percentage(50, 200)")
    assert_equal ["percentage", "(", "50", ",", "200", ")"], tokenizer.tokenize

    tokenizer = Tokenizer.new("to_binary(10)")
    assert_equal ["to_binary", "(", "10", ")"], tokenizer.tokenize

    tokenizer = Tokenizer.new("to_octal(255)")
    assert_equal ["to_octal", "(", "255", ")"], tokenizer.tokenize
  end

  # Test cases for tokenizing invalid arithmetic expressions
  def test_invalid_tokenization
    tokenizer = Tokenizer.new("5 ++ 3")
    assert_equal ["5", "+", "+", "3"], tokenizer.tokenize

    tokenizer = Tokenizer.new("10 - * 3")
    assert_equal ["10", "-", "*", "3"], tokenizer.tokenize

    tokenizer = Tokenizer.new("(8 / 4 + 7")
    assert_equal ["(", "8", "/", "4", "+", "7"], tokenizer.tokenize

    tokenizer = Tokenizer.new("100 % 3)")
    assert_equal ["100", "%", "3", ")"], tokenizer.tokenize

    tokenizer = Tokenizer.new("2 + 3 * (4 - 1")
    assert_equal ["2", "+", "3", "*", "(", "4", "-", "1"], tokenizer.tokenize

    tokenizer = Tokenizer.new("5 + 6 * 7 / 2 -")
    assert_equal ["5", "+", "6", "*", "7", "/", "2", "-"], tokenizer.tokenize

    tokenizer = Tokenizer.new("9 / 3 *")
    assert_equal ["9", "/", "3", "*"], tokenizer.tokenize

    tokenizer = Tokenizer.new("7 + (2 - 1) *")
    assert_equal ["7", "+", "(", "2", "-", "1", ")", "*"], tokenizer.tokenize

    tokenizer = Tokenizer.new("15 % 4 +")
    assert_equal ["15", "%", "4", "+"], tokenizer.tokenize

    tokenizer = Tokenizer.new("5 ( + 3")
    assert_equal ["5", "(", "+", "3"], tokenizer.tokenize

    tokenizer = Tokenizer.new("5 + 3 )")
    assert_equal ["5", "+", "3", ")"], tokenizer.tokenize
    
  end
end
