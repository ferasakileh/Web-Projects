require 'httparty'
require 'json'
require 'dotenv'
require_relative 'course'
require_relative 'write'
Dotenv.load

# This class is responsible for fetching the Todos for each course
class ToDo

  # Set up courses and HTML for the todo lists
  def initialize
    # carmen canvas access token
    @access_token = ENV['ACCESS_TOKEN']

    # an array of course names and IDs
    @courses= Course.new.getCourses

    # Start building the HTML content
    @html_content = <<-HTML
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Course TODOs</title>
        <link rel="stylesheet" href="style.css">
    </head>

    <body>
        <h1 class="header">TODOs for Courses</h1>
        <img class="osu" src="osulogo.webp" alt="osu logo">
        <ul class="list">
    HTML
  end

  # Gets todos from each course
  def getTodos
    # for each loop runs through courses
    @courses.each do |course|

      # get the todos items for the course
      todo_response = HTTParty.get("https://osu.instructure.com/api/v1/courses/#{course[:id]}/todo?access_token=#{@access_token}")
      
      if todo_response.code == 200
        todo_items = JSON.parse(todo_response.body)
      
        # Loop through the courses and add them to the HTML
        #puts "\nTo-Do List for #{course[:name]}:"
        # if there are no todos, show a fun dog fact
        if todo_items.empty?
          quote_response = HTTParty.get("http://dog-api.kinduff.com/api/facts?number=1")
          quote = if quote_response.code == 200
                    quotes = JSON.parse(quote_response.body)
                    quotes['facts'] && !quotes['facts'].empty? ? quotes['facts'].first : 'No dog fact available'
                  else
                    'No dog fact available'
                  end
          # set up html for the dog fact
          @html_content += <<-HTML
            <li>
              <h2 id="complete">To-Dos for #{course[:name]}</h2>
              <p>You have completed all of your todos for this course, here is a fun fact about dogs:</p>
              <blockquote>"#{quote}"</blockquote>
            </li>
          HTML
        else # if there are todos, list them with a dog photo
          @html_content += "<h2>To-Dos for #{course[:name]}</h2>"
          @html_content += <<-HTML
            <table>
            <tr>
              <th>Assignment</th>
              <th>Due Date</th>
              <th>Points</th>
              <th>Dog :)</th>
            </tr>
          HTML
          todo_items.each do |item|
            due_date = item['assignment']['due_at'] ? item['assignment']['due_at'] : 'No due date'

            # Fetch a dog image from this dog API
            dog_image_response = HTTParty.get("https://dog.ceo/api/breeds/image/random")
            dog_image = dog_image_response.code == 200 ? JSON.parse(dog_image_response.body)['message'] : 'No image available'
            
            @html_content += <<-HTML
              <tr>
                <td>#{item['assignment']['name']}</td>
                <td>#{due_date}</td>
                <td>#{item['assignment']['points_possible']}</td>
                <td><img src="#{dog_image}" alt="A photo of a dog" style="width:100px;height:auto;"></td>
                
              </tr>
            HTML
          end
          @html_content += "</table>"
        end
      else
        puts "Failed to retrieve TODO items: #{todo_response.code}"
      end
    end
     
    #put the closing html tags on
    endHtml

  end

  def endHtml
     # Close the HTML tags
    @html_content += <<-HTML
    </ul>
    </body>
    </html>
     HTML

    @html_content
  end


end
