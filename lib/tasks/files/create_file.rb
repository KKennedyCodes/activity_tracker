require 'rbconfig'
require 'etc'
require_relative '../helpers'
require 'pry'

namespace :files do
  desc "Create a new file"
  task :create_file do    
    op_system = Tasks::Helpers.which_op_system()   
    file_name = Tasks::Helpers.input_file_name()
    file_type = Tasks::Helpers.input_file_type()
    file_path = Tasks::Helpers.input_file_path()
    complete_file_path = File.join(file_path, "#{file_name}#{file_type}")
    
    case op_system
    when :mac
      File.open(complete_file_path, 'w') do |file|
        # Write content to the file
        file.puts "File Name: #{file_name}"
        file.puts "File Type: #{file_type}"
        file.puts "File Path: #{file_path}"
        file.puts "\nHello, world!"
      end
      
      puts "New file created at #{complete_file_path}"
      
      Tasks::Helpers.save_activity_log(
      {
      activity: "file creation",
      process_id: Process.pid,
      command_line: ARGV.join(' ')
    }
    )
  when :windows       
  else
    puts "Unsupported operating system"
  end 
end
end
