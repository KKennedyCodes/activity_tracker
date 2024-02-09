# frozen_string_literal: true
require 'pry'
require_relative '../../../helpers'
require_relative '../../logs/operations/create'

module Mac
  module Files
    module Operations
      class Update   
        def call
          puts 'Updating a File'
          
          file_name = Services::Helpers.input_file_name
          file_type = Services::Helpers.input_file_type
          file_path = Services::Helpers.input_file_path
          complete_file_path = File.join(file_path, "#{file_name}#{file_type}")
          
          if File.exist?(complete_file_path)
            File.open(complete_file_path, 'w') do |file|
              #Update the content of the file
              file.puts "\nThis file has been updated!"
            end
            puts "File updated successfully"
            meta_data = { success: true }
            create_log(meta_data)
          else
            puts "File does not exist"
            meta_data = { 
            success: false,
            message: "File does not exist"
          }
          create_log(meta_data)
        end
        
        puts "File updated at #{complete_file_path}"
      end
      
      private
      
      def create_log(meta_data)
        Mac::Logs::Operations::Create.new.call(
        {
        activity: "file deletion",
        meta_data: meta_data
      }
      )
    end
    
  end
end
end
end







require 'rbconfig'
require 'etc'
require_relative '../helpers'
require 'pry'

namespace :files do
  desc "Updates a file"
  task :update_file do    
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
        file.puts "\nAdding Modification!"
      end
      
      puts "File Modified"
      
      Tasks::Helpers.save_activity_log(
      {
      activity: "file modified",
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
