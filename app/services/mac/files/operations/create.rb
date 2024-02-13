require_relative '../../../helpers'
require_relative '../../logs/operations/create'

module Mac
  module Files
    module Operations
      class Create      
        def call(file_path, content)          
          # TO DO: Handle case when file already exists - append # to end.
          # TO DO: Rescue case when file can't be created          
          File.open(file_path, 'w') do |file|
            file.puts content
          end
          
          puts "File Created Successfully"
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
