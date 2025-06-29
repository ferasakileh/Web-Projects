# Functions involving conversions
module CalcConversions
  # Converts a decimal number to binary
  # @param val [Integer] The number to be converted to binary
  # @return [Integer] The binary version of the number inputted
  def decimal_to_binary(val) 
    result = val.to_s(2)
    return result
  end

  # Converts a decimal number to octal
  # @param val [Integer] The number to be converted to octal
  # @return [Integer] The octal version of the number inputted
  def decimal_to_octal(val) 
    result = val.to_s(8)
    return result
  end

  # Converts a decimal number to hex
  # @param val [Integer] The number to be converted to hex
  # @return [Integer] The hex version of the number inputted
  def decimal_to_hex(val) 
    result = val.to_s(16)
    return result
  end

  # Converts a temperature in Fahrenheit to Celsius
  # @param tempF [Numeric] The temperature in F
  # @return [Float] The temperature in C
  def fToC(tempF)
    # temperature conversion
    tempC = tempF - 32
    tempC = tempC * 5.0/9.0
  end
end