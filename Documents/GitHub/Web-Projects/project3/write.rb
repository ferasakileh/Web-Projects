
require_relative 'todo'

class Write
  
  def initialize(html_content)

    @html_content=html_content

  end

  def writeToFile
    # Write the HTML content to a file
    File.open("todos.html", "w") do |file|
      file.write(@html_content)
    end
  end
end
