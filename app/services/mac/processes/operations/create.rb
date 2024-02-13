require 'pry'
require 'shellwords'
require_relative '../../../helpers'
require_relative '../../logs/operations/create'

module Mac
  module Processes
    module Operations
      class Create      
        def call(option, process, params1, params2, params3)          
          application_path = option == :by_name ? find_application_path(process) : process
          if application_path.empty?
            return handle_not_found(process_name)            
          else
            params = [params1, params2, params3].compact.map { |param| Shellwords.escape(param) }.join(" ")
            return open_application(
              app_path: application_path,
              params: params
            )
          end
        end
        
        private
        
        def find_application_path(process_name)
          result = `mdfind '#{process_name}.app'`
          first_result = result.empty? ? "" : result.lines.first.chomp
          return first_result
        end
        
        def open_application(app_path:, params:)
          begin       
            system_command = "open -a '#{app_path}'"
            system_command += " --args #{params}" unless params.empty?
            system(system_command)
            
            meta_data = {
              success: true,
              process: app_path,
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
        
        def handle_not_found(app_name)
          not_found_msg = "The app name: #{app_name} was not found"
          puts not_found_msg
          
          meta_data = {
            success: false,
            error: not_found_msg
          }
          create_log(meta_data)
        end
        
        def create_log(meta_data)
          Mac::Logs::Operations::Create.new.call(
            {
              activity: "process start",
              meta_data: meta_data
            }
          )
        end
      end
    end
  end
end
