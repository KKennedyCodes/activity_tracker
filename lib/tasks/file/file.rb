require 'rbconfig'
require 'etc'
require_relative '../helpers'
require_relative '../../../app/services/mac/files/operations/create'
require_relative '../../../app/services/mac/files/operations/update'
require_relative '../../../app/services/mac/files/operations/destroy'
require 'pry'

namespace :file do
  desc "Manage a file: -c: Create, -u: Update, -d: Delete"
  task :manage, [:file_path, :operation, :content] do |t, args|
    op_system = Tasks::Helpers.which_op_system  
    
    case op_system
    when :mac
      case args.operation
      when "-c"
        Mac::Files::Operations::Create.new.call(args.file_path, args.content)
      when "-u"
        Mac::Files::Operations::Update.new.call(args.file_path, args.content)
      when "-d"
        Mac::Files::Operations::Destroy.new.call(args.file_path)
      else
        puts "Invalid operation specified."
      end
    else
      puts "Unsupported operating system"
    end 
  end
end
