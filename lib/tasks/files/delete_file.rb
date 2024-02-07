require 'rbconfig'
require 'etc'
require_relative '../helpers'
require 'pry'

namespace :files do
  desc "Delete a file"
  task :delete_file do    
    puts "Hello Delete File"
  end
end
