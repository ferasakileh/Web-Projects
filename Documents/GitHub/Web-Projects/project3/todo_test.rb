# File to test the functionality of our methods to retrieve todos from each course
require 'httparty'
require 'json'
require 'dotenv'
require_relative 'course'
Dotenv.load

class ToDoChecker
  def initialize
    @access_token = ENV['ACCESS_TOKEN']
    @courses = Course.new.getCourses
  end

  # checks if there are courses, if no courses then no todos
  def check_todos
    if @courses.empty?
      puts "No courses available."
      return
    end

    @courses.each do |course|
      todo_response = HTTParty.get("https://osu.instructure.com/api/v1/courses/#{course[:id]}/todo?access_token=#{@access_token}")

      if todo_response.code == 200
        todo_items = JSON.parse(todo_response.body)

        if todo_items.empty?
          puts "No to-dos found for #{course[:name]}."
        else
          puts "To-Dos for #{course[:name]}:"
          todo_items.each do |item|
            assignment_name = item['assignment']['name']
            due_date = item['assignment']['due_at'] || 'No due date'
            points_possible = item['assignment']['points_possible']

            puts "- #{assignment_name} (Due: #{due_date}, Points: #{points_possible})"
          end
        end
      else
        puts "Failed to retrieve TODO items for #{course[:name]}: #{todo_response.code}"
      end
    end
  end
end

# Run the ToDo checker
ToDoChecker.new.check_todos
