# frozen_string_literal: true

module Files
  module Operations
    class Create
      def call
        username = Etc.getlogin
        binding.pry
        
        file_name = "New File"
        file_type = ".txt"
        file_path = "/Users/#{username}/Desktop"
        
        puts "Creating a New File"
        # Prompt the user for the file name
        puts 'Enter Your File Name:'
        file_name = STDIN.gets.chomp
        
        puts "Enter Your File Type Extension"
        file_type = STDIN.gets.chomp
        
        puts "Enter the File Path (Default Set to Desktop)"
        p "/Users/#{username}/"
        file_path = STDIN.gets.chomp
      end      
    end
  end
end