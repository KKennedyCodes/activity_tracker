require 'rbconfig'
require 'etc'
require_relative '../helpers'
require_relative '../../../app/services/mac/files/operations/destroy'
require 'pry'

# rake files:delete
namespace :files do
  desc "Delete a File"
  task :delete do    
    op_system = Tasks::Helpers.which_op_system  
    
    case op_system
    when :mac
      Mac::Files::Operations::Destroy.new.call 
    when :windows       
    else
      puts "Unsupported operating system"
    end 
  end
end
