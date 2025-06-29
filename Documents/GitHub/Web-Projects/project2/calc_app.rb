# Include library
require 'glimmer-dsl-libui'
# Include necessary files
require_relative 'input_validator'
require_relative 'tokenizer'
require_relative 'function_evaluator'
require_relative 'parser'
require_relative 'recursive_calculator'
require_relative 'methods'

# Main class used to generate a working calculator
class CalcApp
  # Include necessary modules
  include Glimmer
  include CalculatorMethods
  include InputValidator


  # Read in files for help button
  HELPSTRING_A = File.read('helpstring_A.txt')
  HELPSTRING_B = File.read('helpstring_B.txt')
  
  # Lanuched calculator
  def launch
    str = " " 
    instructions = "Enter a mathematical expression or a list of numbers and press '=' to evaluate."
    term = ""
    exp = ""
    array = []
    window('Calculator', 500, 600) {
      resizable true # allow resizing

      vertical_box {
        @instructions = label { # label to show the input string
          text instructions
          stretchy false
        }

      vertical_box {
        @display = label { # label to show the input string
          text str
        }

        grid {
          padded true

          # Column 0
          button('(') {
            top 0
            left 0

            on_clicked do
              str = str + "("
              exp = exp + "("
              @display.text = str # update label text
            end
          }
          button('1') {
            top 1
            left 0

            on_clicked do
              str = str + "1"
              term = term + "1"
              exp = exp + "1"
              @display.text = str # update label text
            end
          }
          button('4') {
            top 2
            left 0

            on_clicked do
              str = str + "4"
              term = term + "4"
              exp = exp + "4"
              
              @display.text = str # update label text
            end
          }
          button('7') {
            top 3
            left 0

            on_clicked do
              str = str + "7"
              term = term + "7"
              exp = exp + "7"
              @display.text = str # update label text
            end
          }
          button('.') {
            top 4
            left 0

            on_clicked do
              str = str + "."
              term = term + "."
              exp = exp + "."
              @display.text = str # update label text
            end
          }

          # Column 1
          button(')') {
            top 0
            left 1

            on_clicked do
              str = str + ")"
              exp = exp + ")"
              @display.text = str # update label text
            end
          }
          button('2') {
            top 1
            left 1

            on_clicked do
              str = str + "2"
              term = term + "2"
              exp = exp + "2"
              @display.text = str # update label text
            end
          }
          button('5') {
            top 2
            left 1

            on_clicked do
              str = str + "5"
              term = term + "5"
              exp = exp + "5"
              @display.text = str # update label text
            end
          }
          button('8') {
            top 3
            left 1

            on_clicked do
              str = str + "8"
              term = term + "8"
              exp = exp + "8"
              @display.text = str # update label text
            end
          }
          button('0') {
            top 4
            left 1
          
            on_clicked do
              str = str + "0"
              term = term + "0"
              exp = exp + "0"
              @display.text = str # update label text
            end
          }

          # Column 2
          button('%') {
            top 0
            left 2

            on_clicked do
              str = str + "%"
              exp = exp + "%"
              @display.text = str # update label text
            end
          }
          button('3') {
            top 1
            left 2

            on_clicked do
              str = str + "3"
              term = term + "3"
              exp = exp + "3"
              @display.text = str # update label text
            end
          }
          button('6') {
            top 2
            left 2

            on_clicked do
              str = str + "6"
              term = term + "6"
              exp = exp + "6"
              @display.text = str # update label text
            end
          }
          button('9') {
            top 3
            left 2

            on_clicked do
              str = str + "9"
              term = term + "9"
              exp = exp + "9"
              @display.text = str # update label text
            end
          }
          button('=') {
            top 4
            left 2

            on_clicked do
              puts str
              puts exp

              if valid_input?(exp) && array==[]
                #valid input and array is empty
               calc = RecursiveCalculator.new(exp)
               result = calc.evaluate

                if (result != Float::INFINITY) #no divide by 0 error
                  @display.text = result.to_s # update label text
                  str = result.to_s # update label text and make it the result
                else #there was an error with the input
                  @display.text = 'Error. Invalid Input.' # update label text
                  str = ""
                  exp = ""
                end

              else
                @display.text = 'Error. Invalid Input.' # update label text
                  str = ""
                  exp = ""
              end 
            end
          }

          # Column 3
          button('AC') {
            top 0
            left 3

            on_clicked do
              str = ""
              exp = ""
              instructions = "Enter a mathematical expression or a list of numbers and press '=' to evaluate."
              @instructions.text = instructions # update label text
              @display.text = str # update label text
            end
          }
          button('+') {
            top 1
            left 3

            on_clicked do
              str = str + "+"
              exp = exp + "+"
              @display.text = str # update label text
            end
          }
          button('-') {
            top 2
            left 3

            on_clicked do
              str = str + "-"
              exp = exp + "-"
              @display.text = str # update label text
            end
          }
          button('x') {
            top 3
            left 3

            on_clicked do
              str = str + "*"
              exp = exp + "*"
              @display.text = str # update label text
            end
          }
          button('÷') {
            top 4
            left 3

            on_clicked do
              str = str + "/"
              term = term + ""
              exp = exp + "/"
              @display.text = str # update label text
            end
          }

          # Column 4
          button('neg') {
            top 0
            left 4

            on_clicked do
              str = str + "-"
              exp = exp + "q"
              term = term + "q"
              instructions = "Inserting a negative number"
              @instructions.text = instructions # update instructions label
              @display.text = str # update label text
            end
          }
          button('√') {
            top 1
            left 4

            on_clicked do
             str = str + "√("
             exp = exp + "√("
              @display.text = str # update label text
            end
          }
          button('∛') {
            top 2
            left 4

            on_clicked do
              str = str + "∛("
              exp = exp + "∛("
              @display.text = str # update label text
            end
          }
          button('exponent') {
            top 3
            left 4

            on_clicked do
              str = str + "exponent("
              exp = exp + "exponent("
              instructions = "Enter as exponent(base,power)"
              @instructions.text = instructions # update label text
              @display.text = str # update label text
            end
          } 
          button(',') {
            top 4
            left 4

            on_clicked do
              str = str + ","
              exp = exp + ","
              @display.text = str # update label text
            end
          } 
          button('|x|') {
            top 5
            left 4

            on_clicked do
              str = str + "absolute("
              exp = exp + "absolute("
              instructions = "Enter as absolute(a)"
              @instructions.text = instructions # update instructions label
              @display.text = str # update label text
            end
          }

          # Column 5
          button('sin') {
            top 0
            left 5

            on_clicked do
              str = str + "sin("
              exp = exp + "sin("
              @display.text = str # update label text
              instructions = "Enter as sin(angle in radians)"
              @instructions.text = instructions # update label text
            end
          } 
          button('cos') {
            top 1
            left 5

            on_clicked do
              str = str + "cos("
              exp = exp + "cos("
              @display.text = str # update label text
              instructions = "Enter as cos(angle in radians)"
              @instructions.text = instructions # update label text
            end
          } 
          button('tan') {
            top 2
            left 5

            on_clicked do
              str = str + "tan("
              exp = exp + "tan("
              @display.text = str # update label text
              instructions = "Enter as tan(angle in radians)"
              @instructions.text = instructions # update label text
            end
          } 
          button('π') {
            top 3
            left 5

            on_clicked do
              str = str + "π"
              exp = exp + "π"
              @display.text = str # update label text
            end
          }
          button('log') {
            top 4
            left 5

            on_clicked do
              str = str + "log("
              exp = exp + "log("
              @display.text = str # update label text
              instructions = "Enter as log(base,a)"
              @instructions.text = instructions # update label text
            end
          } 
          button('!') {
            top 5
            left 5

            on_clicked do
              str = str + "factorial("
              exp = exp + "factorial("

              instructions = "Enter as factorial(x) to calculate x!"
              @instructions.text = instructions # update label text
              @display.text = str # update label text
            end
          } 

          # Column 6
          button('mean') {
            top 0
            left 6

            on_clicked do
              min_length = 1

              if array.length >= min_length
              result = mean(array)
              @display.text = result.to_s # update label text with the result
              else
                @instructions.text = "Use list button first" # update label text with an error message
              end
            end
          }
          button('median') {
            top 1
            left 6

            on_clicked do
              min_length = 1

              if array.length >= min_length
              result = median(array)
              @display.text = result.to_s # update label text with the result
              else
                @instructions.text = "Use list button first" # update label text with an error message
              end
            end
          }
          button('mode') {
            top 2
            left 6

            on_clicked do
              min_length = 1

              if array.length >= min_length
              result = mode(array)
              @display.text = result.to_s # update label text with the result
              else
                @instructions.text = "Use list button first" # update label text with an error message
              end
            end
          }
          button('min') {
            top 3
            left 6

            on_clicked do
              min_length = 1

              if array.length >= min_length
              result = find_smallest(array)
              @display.text = result.to_s # update label text with the result
              else
                @instructions.text = "Use list button first" # update label text with an error message
              end
            end
          }
          button('max') {
            top 4
            left 6

            on_clicked do
              min_length = 1

              if array.length >= min_length
              result = maximum(array)
              @display.text = result.to_s # update label text with the result
              else
                @instructions.text = "Use list button first" # update label text with an error message
              end
            end
          }
          button('percentage') {
            top 5
            left 6

            on_clicked do
              str = str + "percentage("
              exp = exp + "percentage("

              instructions = "Enter as percentage(x,y)"
              @instructions.text = instructions # update label text
              @display.text = str # update label text
            end
          } 

          # Column 7
          button('list') {
            top 0
            left 7

            on_clicked do
              str = ""
              term = ""
              array = []
              instructions = "Press list add to add numbers to the list."
              @instructions.text = instructions # update label text
              @display.text = str # update label text
            end
          }
          button('list add') {
            top 1
            left 7

            on_clicked do
              str = str + " "
              negative=false
              if term.include? "q"
                #negative number
                negative= true    
                term= term.delete('q')    #remove -     
              end
               
              if term.include? "."
                termFloat = term.to_f

                if negative #make negative
                  termFloat*= -1
                end

                array.push(termFloat)
                instructions = "Added #{termFloat} to the list. Press again to add another number."
              else
                termInt = term.to_i

                if negative #make negative
                  termInt*= -1
                end

                array.push(termInt)
                instructions = "Added #{termInt} to the list. Press again to add another number."
              end
              @instructions.text = instructions # update label text
              @display.text = str # update label text
              term = ""
            end
          }
          button('to binary') {
            top 2
            left 7
            
            on_clicked do
              str = str + "to_binary("
              exp = exp + "to_binary("
              @display.text = str # update label text
            end
          }
          button('to octal') {
            top 3
            left 7

            on_clicked do
              str = str + "to_octal("
              exp = exp + "to_octal("
              @display.text = str # update label text
            end
          }
          button('to hex') {
            top 4
            left 7

            on_clicked do
              str = str + "to_hex("
              exp = exp + "to_hex("
              @display.text = str # update label text
            end
          }
          button('is prime') {
            top 5
            left 7

            on_clicked do
              str = str + "is_prime("
              exp = exp + "is_prime("
              @display.text = str # update text lable
              instructions = "Enter as: is_prime(n). Returns true or false."
              @instructions.text = instructions # update label text
            end
          }

          # Column 8
          button('Generate Odds') {
            top 0
            left 8

            on_clicked do
              str = "odds("
              exp = "odds("

              instructions = "Enter range of odds as odds(min,max)"
              @instructions.text = instructions # update label text
              @display.text = str # update label text
            end
          } 
          button('Generate Evens') {
            top 1
            left 8

            on_clicked do
              str = "evens("
              exp = "evens("

              instructions = "Enter range of evens as evens(min,max)"
              @instructions.text = instructions # update label text
              @display.text = str # update label text
            end
          }
          button('Generate Primes') {
            top 2
            left 8

            on_clicked do
              str = str + ""
              termInt = term.to_i
              primes = generate_primes(termInt)
              instructions = "Generated primes up to #{termInt} and stored in 'primes_#{termInt}.txt'."
              @instructions.text = instructions # update label text
              term = ""
              #@display.text = odds # update label text
            end
          }
          button('Generate Squares') {
            top 3
            left 8

            on_clicked do
              str = "squares("
              exp = "squares("

              instructions = "Enter range of odds as squares(min,max)"
              @instructions.text = instructions # update label text
              @display.text = str # update label text
            end
          }
          button('Generate Fibonacci') {
            top 4
            left 8

            on_clicked do
              str = str + ""
              termInt = term.to_i
              fibs = fibonacci(termInt)
              instructions = "Generated fibonacci sequence up to #{termInt} and stored in 'fibonacci_#{termInt}.txt'."
              @instructions.text = instructions # update label text
              term = ""
              #@display.text = odds # update label text
            end
          }
          button('°F to °C') {
            top 5
            left 8

            on_clicked do
              str = "temp("
              exp = "temp("

              instructions = "Enter a temperature in °F to convert to °C"
              @instructions.text = instructions # update label text
              @display.text = str # update label text
            end
          } 
          button('Help') {
            top 6
            left 8

            on_clicked do
              msg_box(HELPSTRING_A + HELPSTRING_B)
            end     
          }
        }
      }
    }
          
    }.show
  end
end
      
CalcApp.new.launch

      