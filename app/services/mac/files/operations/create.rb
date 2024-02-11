# frozen_string_literal: true
require 'pry'
require_relative '../../../helpers'
require_relative '../../logs/operations/create'

module Mac
  module Files
    module Operations
      class Create      
        def call
          puts 'Creating a New File'
          
          file_name = Helpers.input_file_name
          file_type = Helpers.input_file_type
          file_path = Helpers.input_file_path
          complete_file_path = File.join(file_path, "#{file_name}#{file_type}")
          
          # TO DO: Handle case when file already exists - append # to end.
          # TO DO: Rescue case when file can't be created          
          File.open(complete_file_path, 'w') do |file|
            # Write content to the file
            file.puts "File Name: #{file_name}"
            file.puts "File Type: #{file_type}"
            file.puts "File Path: #{file_path}"
            file.puts "\nHello, world!"
          end
          
          puts "New file created at #{complete_file_path}"
          meta_data = { success: true }
          
          Mac::Logs::Operations::Create.new.call(
          {
          activity: "file creation",
          meta_data: meta_data
        }
        )
      end      
    end
  end
end
end
