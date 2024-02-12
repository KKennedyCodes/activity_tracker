require 'rbconfig'
require 'etc'
require_relative '../helpers'
require_relative '../../../app/services/mac/files/operations/update'
require 'pry'

# rake files:update
namespace :files do
  desc "Update a File"
  task :update do    
    op_system = Tasks::Helpers.which_op_system  
    
    case op_system
    when :mac
      Mac::Files::Operations::Update.new.call       
    else
      puts "Unsupported operating system"
    end 
  end
end
