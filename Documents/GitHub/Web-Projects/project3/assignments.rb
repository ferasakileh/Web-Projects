require 'httparty'
require 'json'
require 'dotenv'
Dotenv.load

access_token = ENV['ACCESS_TOKEN']

response = HTTParty.get("https://osu.instructure.com/api/v1/courses?access_token=#{access_token}")

# Check if the response was successful
if response.code == 200
  # Parse the JSON response to get the courses
  courses = JSON.parse(response.body)

  # Start building the HTML content
  html_content = <<-HTML
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Course List</title>
      <link rel="stylesheet" href="style.css">
  </head>

  <body>
      <h1 class="header">Your Assignments</h1>
      <img class="osu" src="osulogo.webp" alt="osu logo">
      <ul class="list">
  HTML

  # Loop through the courses and add them to the HTML
  courses.each do |course|
    courseID = course['id']
    html_content += "<li>#{course['name']}</li>"
    response2 = HTTParty.get("https://osu.instructure.com/api/v1/courses/#{courseID}/assignments?access_token=#{access_token}")
    if response2.code == 200
      html_content += <<-HTML
          <table>
            <tr>
              <th>Assignment</th>
              <th>Points</th>
            </tr>
      HTML
      assignments = JSON.parse(response2.body)
      assignments.each do |assignment|
        # get dog photo
        dog_image_response = HTTParty.get("https://dog.ceo/api/breeds/image/random")
        dog_image = dog_image_response.code == 200 ? JSON.parse(dog_image_response.body)['message'] : 'No image available'
        html_content += "<tr>"
        html_content += "<td>#{assignment['name']}</td>"
        html_content += "<td>#{assignment['points_possible']}</td>"
        # display dog photo
        html_content += "<td><img src='#{dog_image}' alt='A photo of a dog' style='width:100px;height:auto;'></td>" 
        html_content += "</tr>"
      end
      html_content += "</table>"
    else
      # Print an error message if the request was unsuccessful
      puts "Failed to retrieve second data: #{response2.code} for course #{courseID}"
    end
  end

  # Close the HTML tags
  html_content += <<-HTML
      </ul>
  </body>
  </html>
  HTML

  # Write the HTML content to a file
  File.open("assignment_list.html", "w") do |file|
    file.write(html_content)
  end

  puts "HTML file 'assignment_list.html' has been generated successfully."

else
  # Print an error message if the request was unsuccessful
  puts "Failed to retrieve data: #{response.code}"
end