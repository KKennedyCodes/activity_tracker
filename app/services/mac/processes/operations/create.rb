# frozen_string_literal: true
require 'pry'
require 'shellwords'
require_relative '../../../helpers'
require_relative '../../logs/operations/create'

module Mac
  module Processes
    module Operations
      class Create      
        def call
          puts 'Starting a Process'
          
          # open -a /Applications/MyApp.app --args --option1 value1 --option2 value2
          application_name = Helpers.input_application_name
          params = Helpers.input_optional_params
          
          application_path = find_application_path(application_name)
          
          begin       
            system_command = "open -a '#{application_path}'"
            system_command += "  --args #{params}" unless params == nil 
            system("open -a #{system_command}")
            
            meta_data = {
            success: true,
            process: application_path,
            parameters: params
          }
          create_log(meta_data)
        rescue => e
          puts "An error occurred: #{e.message}"
          meta_data = {
          success: false,
          error: e
        }
        create_log(meta_data)
      end
    end
    
    private
    
    def find_application_path(application_name)
      result = `mdfind '#{application_name}.app'`
      first_result = result.lines.first.chomp
      return first_result
    end
    
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
