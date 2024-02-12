require 'rbconfig'
require 'etc'
require_relative '../helpers'
require_relative '../../../app/services/mac/network_connections/operations/transmit'
require 'pry'

# rake network:transmit
namespace :network do
  desc "Transmitting Data"
  task :transmit do    
    op_system = Tasks::Helpers.which_op_system  
    
    case op_system
    when :mac
      Mac::NetworkConnections::Operations::Transmit.new.call       
    else
      puts "Unsupported operating system"
    end 
  end
end
