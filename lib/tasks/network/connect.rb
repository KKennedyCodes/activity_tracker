require 'rbconfig'
require 'etc'
require_relative '../helpers'
require_relative '../../../app/services/mac/network_connections/operations/connect'
require 'pry'

# rake files:create
namespace :network do
  desc "Connecting to a Network"
  task :connect do    
    op_system = Tasks::Helpers.which_op_system  
    
    case op_system
    when :mac
      Mac::NetworkConnections::Operations::Connect.new.call 
    when :windows       
    else
      puts "Unsupported operating system"
    end 
  end
end
