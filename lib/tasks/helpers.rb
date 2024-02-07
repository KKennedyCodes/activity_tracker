require 'rbconfig'
require 'date'
require 'json'
require 'pry'
require 'csv'

module Tasks
  module Helpers
    
    def self.input_file_name
      puts 'Enter Your File Name: (Default Set to new_file)'
      file_name = STDIN.gets.chomp
      return file_name.empty? ? "new_file" : file_name
    end
    
    def self.input_file_path
      username = Etc.getlogin
      puts "Enter the File Path (Default Set to Desktop):"
      p "/Users/#{username}/"
      file_path = STDIN.gets.chomp
      custom_path = file_path.empty? ? "Desktop" : file_path
      return "/Users/#{username}/#{custom_path}"
    end
    
    def self.input_file_type
      puts "Enter Your File Type Extension (Default Set to .txt)"
      file_type = STDIN.gets.chomp
      return file_type.empty? ? ".txt" : file_type
    end
    
    def self.save_activity_log(data)      
      username = Etc.getlogin
      data[:user_name] = username
      
      date_time = DateTime.now
      data[:timestamp] = date_time
      
      folder_path = "/Users/#{username}/Desktop/activity_logs/"
      csv_file_path = "#{folder_path}#{date_time}.csv"
      
      FileUtils.mkdir_p(folder_path) unless File.directory?(folder_path)
      CSV.open(csv_file_path, 'w') do |csv|
        csv << data.keys
        csv << data.values
      end
      
      puts "Log Created"
    end
    
    # def self.unique_file_name(base_file_name)
    #   return base_file_name unless File.exist?(base_file_name)
    
    #   counter = 1
    #   while File.exist?("#{base_file_name}_#{counter}")
    #     counter += 1
    #   end
    
    #   "#{base_file_name}_#{counter}"
    # end
    
    def self.which_op_system
      # commonly used keys in RbConfig::CONFIG:
      
      # 'host_os': Operating system name.
      # 'host_cpu': CPU architecture.
      # 'host_vendor': Vendor of the CPU (e.g., 'pc').
      # 'ruby_install_name': Name of the Ruby executable.
      # 'bindir': Directory where Ruby executables are located.
      # 'libdir': Directory where Ruby libraries are located.
      # 'includedir': Directory where C header files are located.
      # 'ruby_version': Ruby version (e.g., '2.7.3').
      # 'arch': Architecture-specific path component.
      # 'EXEEXT': Executable file extension (e.g., '.exe' on Windows).
      
      
      os_name = RbConfig::CONFIG['host_os']
      
      case os_name
      when /darwin/i
        return(:mac)
      when /mswin|msys|mingw|cygwin|bccwin|wince|emc/i
        return(:windows)
        # when /linux/i
        #   return("Linux")
      else
        return(nil)
      end
    end
  end
end

