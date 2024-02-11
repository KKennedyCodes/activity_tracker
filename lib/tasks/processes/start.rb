require 'rbconfig'
require 'etc'
require_relative '../helpers'
require_relative '../../../app/services/mac/processes/operations/create'
require 'pry'

# rake processes:start
namespace :processes do
  desc "Starting a Process"
  task :start do    
    op_system = Tasks::Helpers.which_op_system  
    
    case op_system
    when :mac
      Mac::Processes::Operations::Create.new.call 
    when :windows       
    else
      puts "Unsupported operating system"
    end 
  end
end
