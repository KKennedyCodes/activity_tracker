# frozen_string_literal: true
require 'pry'
require 'socket'
# require_relative '../../../helpers'
# require_relative '../../logs/operations/create'

#client
module Mac
  module NetworkConnections
    module Operations
      class Transmit
        
        
        # Destination address and port
        DEST_ADDRESS = 'localhost'
        dest_port = 12346
        
        def call
          dest_port = Helpers.input_port_number
          # Amount of data to send
          data = 'Hello, world!'
          
          # Open a socket
          socket = TCPSocket.new(DEST_ADDRESS, dest_port)
          
          # Send data
          socket.puts(data)
          
          # Receive response
          response = socket.gets
          puts "Response from server: #{response}"
          
          # Close the socket
          socket.close
          
        end
      end
    end
  end
end
