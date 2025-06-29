# this file is supposed to pull up your todos for a course (you will be prompted to select a course) with a dog photo 
require 'httparty'
require 'json'
require 'dotenv'
Dotenv.load


class Course

  # This function gets the access token
  def initialize
    @access_token = ENV['ACCESS_TOKEN']
  end

  # This function gets each AU24 course
  def getCourses
    response = HTTParty.get("https://osu.instructure.com/api/v1/courses?access_token=#{@access_token}&include=term&per_page=100")
    #response = HTTParty.get("https://canvas.instructure.com/api/v1/courses?enrollment_type=student", headers: { "Authorization" => "Bearer #{access_token}" })

    if response.code != 200
      # Print an error message if the request was unsuccessful
      puts "Failed to retrieve courses: #{response.code}"
      exit
    else
      # Parse the JSON response to get the courses
      courses = JSON.parse(response.body)

      # Filter out the courses with the "Autumn 2024" term
      au24_courses = []
      
      courses.each do |course|
        if course['term'] && course['term']['name'] == 'Autumn 2024'
          au24_courses << { name: course['name'], id: course['id'] }
        end
      end

      # return the AU24 course IDs
      au24_courses
    end

  end

end
