# frozen_string_literal: true
require 'pry'
module MacOS
  module Files
    module Operations
      class Create
        
        # option :file_type
        # option :file_name
        # option :file_path
        
        def call
          binding.pry
          puts 'Creating a New File'
          
          # # Prompt the user for the file name
          # puts 'Enter Your File Name:'
          # file_name = gets.chomp
          
          # # Specify the file path using the user's home directory
          # file_path = File.join(Dir.home, file_name)
          
          # # Open the file in write mode (creates the file if it doesn't exist)
          # File.open(file_path, 'w') do |file|
          #   # Write content to the file if needed
          #   file.puts 'Hello, this is the content of the new file.'
          # end
          
          # puts "New file created at #{file_path}"
        end      
      end
    end
  end
end