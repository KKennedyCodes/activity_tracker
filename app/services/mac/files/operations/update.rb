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
          
          file_name = Helpers.input_file_name
          file_type = Helpers.input_file_type
          file_path = Helpers.input_file_path
          complete_file_path = File.join(file_path, "#{file_name}#{file_type}")
          
          if File.exist?(complete_file_path)
            Helpers.update_file_content(:mac, complete_file_path)
            
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
        activity: "file update",
        meta_data: meta_data
      }
      )
    end  
  end
end
end
end
