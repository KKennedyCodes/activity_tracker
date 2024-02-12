require 'rbconfig'
require 'date'
require 'pry'
require 'csv'
require 'json'

module Mac
  module Logs    
    module Operations
      class Report
        
        def call      
          username = Etc.getlogin
          folder_path = "/Users/#{username}/Desktop/activity_logs/"
          
          csv_files = Dir.glob(File.join(folder_path, "*.csv"))
          
          date_time = DateTime.now.strftime("%Y-%m-%dT%H:%M:%S%:z")
          reports_folder_path = "#{folder_path}reports"
          Dir.mkdir(reports_folder_path) unless Dir.exist?(reports_folder_path)   
          
          complete_file_path = File.join(folder_path, "reports", "#{date_time}.json")      
          binding.pry
          json_data = []
          
          binding.pry
          csv_files.each do |csv_file|
            CSV.foreach(csv_file, headers: true) do |row|
              json_data << row.to_hash
            end
          end
          binding.pry
          File.open(complete_file_path, 'w') do |file|
            file.write(JSON.pretty_generate(json_data))
          end
          binding.pry
          puts "CSV files merged successfully. Merged file: #{complete_file_path}}"
          
          delete_reported_logs(csv_files)
          
          return json_data
        end
        
        private
        
        def delete_reported_logs(csv_files)
          csv_files.each do |csv_file|
            File.delete(csv_file)
          end
        end
      end
    end
  end
end
