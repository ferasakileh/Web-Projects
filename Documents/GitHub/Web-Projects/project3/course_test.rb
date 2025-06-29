# tests the retrieval and filtration of our function thats finds courses
require 'httparty'
require 'json'
require 'dotenv/load'

class CourseChecker
  def initialize
    @access_token = ENV['ACCESS_TOKEN']
  end

  # check if the courses are from AU24 or not
  def check_courses
    courses = get_courses
    puts "Testing the course retrieval and filtration function in course.rb:"
    if courses.empty?
      puts "No courses found for Autumn 2024 (AU24). You need to have AU24 courses for the TODOs list to work."
    else
      puts "Found the following AU24 courses:"
      courses.each { |course| puts "- #{course[:name]} (ID: #{course[:id]})" }
    end
  end

  private

  # get courses
  def get_courses
    response = HTTParty.get("https://osu.instructure.com/api/v1/courses?access_token=#{@access_token}&include=term&per_page=100")

    if response.code != 200
      puts "Failed to retrieve courses: #{response.code}"
      exit
    else
      courses = JSON.parse(response.body)
      au24_courses = []

      courses.each do |course|
        if course['term'] && course['term']['name'] == 'Autumn 2024'
          au24_courses << { name: course['name'], id: course['id'] }
        end
      end

      au24_courses
    end
  end
end

# Run the course checker
CourseChecker.new.check_courses
