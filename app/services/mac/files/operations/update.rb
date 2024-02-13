
require_relative '../../../helpers'
require_relative '../../logs/operations/create'

module Mac
  module Files
    module Operations
      class Update   
        def call(file_path, content)          
          if File.exist?(file_path)
            File.open(file_path, 'w') do |file|
              file.puts content
            end
            
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
          
          puts "File Updated Successfully"
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
