require 'rbconfig'
require 'date'
require 'pry'
require 'csv'

module Mac
  module Logs    
    module Operations
      class Create 
        
        def call(log_data)      
          username = Etc.getlogin
          log_data[:user_name] = username
          
          date_time = DateTime.now
          log_data[:timestamp] = date_time
          
          log_data[:process_id] = Process.pid
          log_data[:command_line] =  ARGV.join(' '),
          
          folder_path = "/Users/#{username}/Desktop/activity_logs/"
          csv_file_path = "#{folder_path}#{date_time}.csv"
          
          FileUtils.mkdir_p(folder_path) unless File.directory?(folder_path)
          CSV.open(csv_file_path, 'w') do |csv|
            csv << log_data.keys
            csv << log_data.values
          end
          
          puts "Log Created - #{csv_file_path}"
        end
      end
    end
  end
end
