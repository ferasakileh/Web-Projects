# Constants
TOKEN_PATTERN = /
  \d*\.\d+ |   # Decimal numbers
  \d+ |        # Integer numbers
  [\+\-\*\/\%] | # Operators
  \(|\)|       # Parentheses
  √|∛|log|,|sin|cos|tan|exponent|percentage|factorial|temp|odds|evens|squares|primes|is_prime|q|π # Functions
/x
# Responsible for checking the input before calculating
module InputValidator

  # Validates if the given input string is a properly formatted mathematical expression
  # @param s [String] The input string representing a mathematical expression
  # @return [Boolean] Returns true if the input string is valid, false otherwise
  def valid_input?(s)

    #Check for valid operator placement
    return false unless valid_operators?(s)

    #check for valid paretnheses placement
    return false unless parentheses_balanced?(s)

    true
  end

  # Method to check for balanced parentheses
  # @param s [String] The input string to check for balanced parentheses
  # @return [Boolean] Returns true if the parentheses are balanced, false otherwise
  def parentheses_balanced?(s)
    stack = []
    s.each_char do |char|
      if char == '('
        stack.push(char)
      elsif char == ')'
        return false if stack.empty? || stack.pop != '('
      end
    end
    stack.empty? # If stack is empty, parentheses are balanced
  end

  # Validates the placement of operators in the given string to ensure correct syntax
  # @param s [String] The input string containing the expression to validate
  # @return [Boolean] Returns true if the operators are placed correctly, false otherwise
  def valid_operators?(s)
    tokens = s.scan(TOKEN_PATTERN)
    
    # Debug: Print tokens for inspection
    puts "Debug: Tokens: #{tokens.inspect}"

    # Check if tokens are empty or start/end with invalid tokens
    return false if tokens.empty?
    return false if tokens.first =~ /[\+\-\*\/\%\)]|[ \t]/ 
    return false if tokens.last =~ /[\+\-\*\/\%\(]|[ \t,]/

    tokens.each_cons(2) do |prev, curr|
      # Debug: Print previous and current tokens
      puts "Checking tokens: prev=#{prev}, curr=#{curr}"

      # Check that operators aren't next to each other
      if prev =~ /[\+\-\*\/\%]/ && curr =~ /[\+\-\*\/\%]/
        puts "Consecutive operators: #{prev} #{curr}"
        return false
      end

      # Check no operator is directly after an opening parenthesis or before a closing parenthesis
      if prev == '(' && curr =~ /[\+\-\*\/\%]/ 
        puts "Operator after '(': #{prev} #{curr}"
        return false
      end
      if curr == ')' && prev =~ /[\+\-\*\/\%]/
        puts "Operator before ')': #{prev} #{curr}"
        return false
      end

      if prev =~ /\d*\.\d+|\d+/ && curr =~ /[(|√|∛|log|sin|cos|tan|exponent|percentage|factorial|temp|odds|evens|squares|primes|is_prime|π]/
        puts "digit before '(' or function: #{prev} #{curr}"
        return false
      end
      if prev == ')' && curr =~ /\d*\.\d+|\d+/
        puts "digit after ')' or : #{prev} #{curr}"
        return false
      end

      # Ensure functions are followed by an opening parenthesis
      if prev =~ /sin|cos|tan|log|percentage|factorial|temp|absolute|isPrime|exponent|odds|evens|is_prime|squares|primes|√|∛/ && curr != '('
        puts "Function without '(': #{prev} #{curr}"
        return false
      end

      # Ensure "percentage", "exponent", etc., are followed by a valid structure
      if (prev == 'percentage' || prev == 'exponent' || prev == 'absolute' || prev == 'odds' || prev == 'evens' || prev == 'squares') && (curr != '(' || !s.include?(','))
        puts "Invalid structure for: #{prev} #{curr}"
        return false
      end
    end

    true
  end
end