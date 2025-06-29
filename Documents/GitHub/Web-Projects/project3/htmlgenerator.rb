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
      <h1 class="header">Your Courses</h1>
      <img class="osu" src="osulogo.webp" alt="osu logo">
      <ul class="list">
  HTML

  # Loop through the courses and add them to the HTML
  courses.each do |course|
    html_content += "<li>#{course['name']}</li>"
  end

  # Close the HTML tags
  html_content += <<-HTML
      </ul>
  </body>
  </html>
  HTML

  # Write the HTML content to a file
  File.open("course_list.html", "w") do |file|
    file.write(html_content)
  end

  puts "HTML file 'course_list.html' has been generated successfully."

else
  # Print an error message if the request was unsuccessful
  puts "Failed to retrieve data: #{response.code}"
end