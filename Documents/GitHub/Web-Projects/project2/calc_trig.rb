# Various trig functions
module CalcTrig
  # Function to calculate sine
  # @param angle [Numeric] The angle to find the sine of, entered in radians
  # @return [Float] The sine of the angle
  def sine(angle)
    Math.sin(angle)
  end

  # Function to calculate cosine
  # @param angle [Numeric] The angle to find the cosine of, entered in radians
  # @return [Float] The cosine of the angle
  def cosine(angle)
    Math.cos(angle)
  end

  # Function to calculate tangent
  # @param angle [Numeric] The angle to find the tangent of, entered in radians
  # @return [Float] The tangent of the angle
  def tangent(angle)
    Math.tan(angle)
  end

end