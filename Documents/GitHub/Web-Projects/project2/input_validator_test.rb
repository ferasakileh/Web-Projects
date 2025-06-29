# Include testing interface
require 'minitest/autorun'
# Include file
require_relative 'input_validator'

# Class tests valid and invalid inputs for reliability and accuracy
class InputValidatorTest < Minitest::Test
  include InputValidator

  # Test cases for valid inputs
  def test_valid_inputs
    assert valid_input?("5 + 3")
    assert valid_input?("(5 + 3) * 2")
    assert valid_input?("√(16)")
    assert valid_input?("sin(π / 2)")
    assert valid_input?("factorial(5)")
    assert valid_input?("percentage(50, 100)")
    assert valid_input?("exponent(2, 3)")
    assert valid_input?("odds(1, 10)")
    assert valid_input?("evens(1, 10)")
    assert valid_input?("squares(1, 5)")
    assert valid_input?("primes(1, 10)")
    assert valid_input?("isPrime(7)")
    assert valid_input?("temp(100)")
    assert valid_input?("5 * (2 + 3) - 8 / 4")
    assert valid_input?("(5)")
    assert valid_input?("π")
  end

  # Test cases for invalid inputs
  def test_invalid_inputs
    refute valid_input?("5 ++ 3")
    refute valid_input?("5 + * 3")
    refute valid_input?("(5 + 3")
    refute valid_input?("5 + 3)")
    refute valid_input?("5 ( + 3")
    refute valid_input?("5 + 3 )")
    refute valid_input?("sin(5 + 3")
    refute valid_input?("5 + 3) sin(")
    refute valid_input?("5 ++ (3")
    refute valid_input?("5 + percentage(50)")
    refute valid_input?("5 + odds(1)")
    refute valid_input?("5 + evens(1)")
    refute valid_input?("5 + squares(1)")
    refute valid_input?("5 * (2 + 3 - 8 / 4")
  end
end
