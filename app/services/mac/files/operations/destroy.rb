# frozen_string_literal: true
require 'pry'
require_relative '../../../helpers'
require_relative '../../logs/operations/create'

module Mac
  module Files
    module Operations
      class Destroy      
        def call
          puts 'Deleting a File'
          
          file_name = Helpers.input_file_name
          file_type = Helpers.input_file_type
          file_path = Helpers.input_file_path
          complete_file_path = File.join(file_path, "#{file_name}#{file_type}")
          
          File.delete(complete_file_path)
          puts "File deleted successfully"
          
          meta_data = { success: true }
          create_log(meta_data)
          
        rescue Errno::ENOENT
          puts "File failed to delete.  The file does not exist."
          meta_data = {
          success: false,
          error: "Errno::ENOENT",
          message: "File does not exist"
        }
        create_log(meta_data)
      rescue Errno::EACCES
        puts "File failed to delete.  Permission denied."
        meta_data = {
        success: false,
        error: "Errno::EACCES",
        message: "Permission denied"
      }
      create_log(meta_data)
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
