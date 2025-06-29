# This is our driver file to run the program
require 'httparty'
require 'json'
require 'dotenv'
require_relative 'course'
require_relative 'write'
require_relative 'todo'

html=ToDo.new.getTodos
#write html content to file

w= Write.new(html)
w.writeToFile

