# frozen_string_literal: true

class Helpers
  
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
end