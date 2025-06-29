require 'httparty'
require 'dotenv'

#loads access token from .env
Dotenv.load

access_token = ENV['ACCESS_TOKEN']

# URL for the API request
url = "https://osu.instructure.com/api/v1/courses"


# Making the GET request with the Authorization header
response = HTTParty.get(
  url,
  headers: {
    "Authorization" => "Bearer #{access_token}"
  }
)

# Print the response body
puts response.body

