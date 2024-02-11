require 'rbconfig'
require 'etc'
require_relative '../helpers'
require_relative '../../../app/services/mac/files/operations/create'
require 'pry'

# rake files:create
namespace :files do
  desc "Create a new file"
  task :create do    
    op_system = Tasks::Helpers.which_op_system  
    
    case op_system
    when :mac
      Mac::Files::Operations::Create.new.call 
    when :windows       
    else
      puts "Unsupported operating system"
    end 
  end
end
