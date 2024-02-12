# frozen_string_literal: true
require 'pry'
require 'socket'
require_relative '../../../helpers'
require_relative '../../logs/operations/report'

#client
module Mac
  module NetworkConnections
    module Operations
      class Transmit
        
        DEST_ADDRESS = 'localhost'
        dest_port = 12346
        
        def call
          dest_port = Helpers.input_port_number
          data = JSON.generate(Mac::Logs::Operations::Report.new.call)
          
          socket = TCPSocket.new(DEST_ADDRESS, dest_port)
          
          socket.puts(data)
          
          response = socket.gets
          puts "Response from server: #{response}"
          
          socket.close
        end
      end
    end
  end
end
