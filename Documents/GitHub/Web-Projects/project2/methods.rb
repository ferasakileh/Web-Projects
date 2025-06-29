# Include necessary files
require_relative 'calc_math'
require_relative 'calc_trig'
require_relative 'calc_generators'
require_relative 'calc_statistics'
require_relative 'calc_conversions'
# Calculates the absolute value of a number
module CalculatorMethods
  include CalcMath
  include CalcTrig
  include CalcGenerators
  include CalcStatistics
  include CalcConversions
end
