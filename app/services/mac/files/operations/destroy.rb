
require_relative '../../../helpers'
require_relative '../../logs/operations/create'

module Mac
  module Files
    module Operations
      class Destroy      
        def call(file_path)          
          if File.exist?(file_path)
            File.delete(file_path)
            puts "File deleted successfully"
            meta_data = { success: true }
            create_log(meta_data)
          else
            puts "Error: File does not exist"
            meta_data = { 
              success: false,
              message: "File does not exist"
            }
            create_log(meta_data)
          end
          
        rescue Errno::EACCES
          puts "Error: File failed to delete. Permission denied."
          meta_data = {
            success: false,
            error: "Errno::EACCES",
            message: "Permission denied"
          }
          create_log(meta_data)
        rescue => e
          puts "Error: File failed to delete. An error occurred: #{e.message}"
          meta_data = {
            success: false,
            error: e.class.name,
            message: e.message
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
