module Tasks
  module Helpers
    def self.which_op_system      
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
