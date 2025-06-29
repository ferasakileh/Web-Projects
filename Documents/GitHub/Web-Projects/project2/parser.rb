require_relative 'methods'
# A class that is in charge of parsing tokens and evaluating expressions
class Parser
  include CalculatorMethods
  
  # Captures and sets up current token
  # @param tokens [Array<String>] The tokens representing a mathematical expression
  # @return [Parser] A new instance of Parser
  def initialize(tokens)
    @tokens = tokens
    @current_token = @tokens.shift
  end

  # Advances to the next token, like dequeue
  # This method updates the current token to the next token in the sequence
  # @return [void]
  def advance
    @current_token = @tokens.shift
  end

  # Parsing an entire expression (expr → term { + term | - term })
  # @return [Float, Integer] The result of the evaluated expression
  def parse_expr
    result = parse_term
    
    while @current_token == '+' || @current_token == '-'
      if @current_token == '+'
        advance
        result += parse_term
      elsif @current_token == '-'
        advance
        result -= parse_term
      end
    end
    result
  end

  # Parsing a term (term → factor { * factor | / factor | % factor})
  # @return [Float, Integer] The result of the term evaluation
  def parse_term
    result = parse_factor
    
    while @current_token == '*' || @current_token == '/' || @current_token == '%'

      if @current_token == '*'
        #if multiplier
        advance #eat *
        result *= parse_factor
      elsif @current_token == '/'
        #if divisor
        advance #eat 
        divisor = parse_factor
        #check for divide by 0
        if divisor!=0
          result=result * 1.0 / divisor
        else
          #returns error
          return Float::INFINITY
        end

      elsif @current_token == '%'
        advance # eat '%'
        divisor = parse_factor
        #check for mod by 0
        if divisor!=0
          result=result % divisor
        else
          #returns error
          result = Float::INFINITY
        end

      end
    end
    result
  end

  # Parsing a factor (factor → ( expr ) | digit-seq)
  # @return [Float, Integer] The result of the factor evaluation
  def parse_factor
    if @current_token == '('
      advance # consume '('
      result = parse_expr
      advance # consume ')'
      result
    elsif @current_token == '√' || @current_token == '∛' || @current_token == 'sin' || @current_token == 'cos' || @current_token == 'tan' 
      parse_function
    elsif @current_token == 'log' || @current_token == 'exponent' || @current_token == 'percentage' || @current_token == 'temp' || @current_token == 'factorial'  
      parse_function
    elsif @current_token == 'odds' || @current_token == 'evens' || @current_token == 'squares' || @current_token == 'primes' || @current_token == 'isPrime'
      parse_function
    elsif @current_token == 'absolute' || @current_token == 'to_binary' || @current_token == 'to_octal' || @current_token == 'to_hex' || @current_token == 'is_prime'
      parse_function
    elsif @current_token == 'π'
      advance # consume 'π'
      Math::PI
    else
      parse_digit_seq
    end
  end

  # Parsing a function call (function → function-name ( expr { , expr }* ))
  # @return [Float, Integer] The result of the function evaluation
  def parse_function
    function = @current_token
    advance # consume the function name
  
    if @current_token == '('
      advance # consume '('
      base = parse_expr # First argument (base)
      
      if @current_token == ',' # Check if there is a second argument
        advance # consume ','
        argument = parse_expr # Second argument
      else
        argument = nil # No second argument
      end
  
      if @current_token == ')' # Check for closing parenthesis
        advance # consume ')'
      else
        return Float::INFINITY
      end
  
      case function
      when 'sin'
        sine(base) # Takes in radians
      when 'cos'
        cosine(base) # Takes in radians
      when 'tan'
        tangent(base) # Takes in radians
      when '√'
        square_root(base)
      when '∛'
        cube_root(base)
      when 'temp'
        fToC(base)
      when 'absolute'
        absolute(base)
      when 'primes'
        generate_primes(base)
      when 'factorial'
        factorial(base)
      when 'to_binary'
        decimal_to_binary(base)
      when 'to_octal'
        decimal_to_octal(base)
      when 'to_hex'
        decimal_to_hex(base)
      when 'log'
        # Ensure base and argument are valid for log calculation
        if base <= 0 || base == 1 || argument <= 0
          raise "Base and argument must be positive, and base cannot be 1 for log function"
        end
        log(base, argument) # Use custom log function
      when 'exponent'
        exponent(base, argument) # Use custom exponent function
      when 'is_prime'
        is_prime(base)
      when 'percentage'
        percentage(base, argument) # Use custom percentage function
      when 'odds'
        generate_odd_numbers(base, argument)
      when 'evens'
        generate_even_numbers(base, argument)
      when 'squares'
        generate_squares(base, argument)
      when 'isPrime'
        is_prime(base)
      else
        raise "Unknown function: #{function}"
      end
    else
      raise "Expected '(' after function name"
    end
  end
  

  # Parsing a sequence of digits (digit-seq → digit { digit })
  # @return [Float, Integer] The numerical value of the digit sequence
  def parse_digit_seq 

    negative= false
    if @current_token == 'q'
      #if the number should be negative, indicated by 'q', negative=true and eat the q token
      negative = true
      advance
    end

    if @current_token && @current_token.include?('.') 
      #if its a decimal
      result = @current_token.to_f
    else 
      result= @current_token.to_i
    end
    
    advance

    if negative
      result *= -1
    end

    result
  end
end