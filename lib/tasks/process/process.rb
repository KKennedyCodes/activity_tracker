require 'rbconfig'
require 'etc'
require_relative '../helpers'
require_relative '../../../app/services/mac/processes/operations/create'
require 'pry'

namespace :process do
  desc "Start a Process with Optional Parameters"
  task :start_by_name, [:process_name, :params1, :params2, :params3] do |t, args|
    op_system = Tasks::Helpers.which_op_system  
    
    case op_system
    when :mac
      Mac::Processes::Operations::Create.new.call(
        :by_name,
        args.process_name,
        args.params1,
        args.params2,
        args.params3
      )
    else
      puts "Unsupported operating system"
    end 
  end
  
  task :start_by_path, [:process_path, :params1, :params2, :params3] do |t, args|
    op_system = Tasks::Helpers.which_op_system  
    
    case op_system
    when :mac
      Mac::Processes::Operations::Create.new.call(
        :by_path,
        args.process_path,
        args.params1,
        args.params2,
        args.params3
      )
    else
      puts "Unsupported operating system"
    end 
  end
end
