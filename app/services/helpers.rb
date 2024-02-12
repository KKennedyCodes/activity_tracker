# frozen_string_literal: true

module Helpers
  
  def self.input_file_name
    puts 'Enter Your File Name: (Default Set to new_file)'
    file_name = STDIN.gets.chomp
    return file_name.empty? ? "new_file" : file_name
  end
  
  def self.input_file_path
    username = Etc.getlogin
    puts "Enter the File Path (Default Set to Desktop):"
    p "/Users/#{username}/"
    file_path = STDIN.gets.chomp
    custom_path = file_path.empty? ? "Desktop" : file_path
    return "/Users/#{username}/#{custom_path}"
  end
  
  def self.input_file_type
    puts "Enter Your File Type Extension (Default Set to .txt)"
    file_type = STDIN.gets.chomp
    return file_type.empty? ? ".txt" : file_type
  end
  
  def self.input_application_name
    puts "Enter the Application You Want to Open"
    application = STDIN.gets.chomp
    return application.empty? ? "Calculator.app" : application
  end
  
  def self.input_optional_params
    puts "Enter Your Optional Params"
    puts "example: spotify:playlist:09Aacdz2QLn0ElFu58joQx?si=88f88d6ca72848e3"
    params = STDIN.gets.chomp
    return params.empty? ? nil : params
  end
  
  def self.input_port_number
    puts "Enter Port:"
    STDIN.gets.chomp
  end
  
  def self.update_file_content(op_system, complete_file_path)
    file_contents = File.read(complete_file_path)
    
    # Display the current contents to the user
    puts "Current contents of the file:"
    puts file_contents
    
    # Ask the user for edits
    key_instructions = {
    mac: "Ctrl + D",
    windows: "Ctrl + Z"   
  }
  
  puts "Enter your edits below. Press Enter followed by #{key_instructions[op_system]} to save:"
  edited_contents = $stdin.read
  
  # Write the edited contents back to the file
  File.open(complete_file_path, 'w') do |file|
    file.puts edited_contents
  end
end
end
