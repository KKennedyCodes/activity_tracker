# frozen_string_literal: true
require 'pry'
require 'socket'
# require_relative '../../../helpers'
# require_relative '../../logs/operations/create'
# server
module Mac
  module NetworkConnections
    module Operations
      class Connect        
        def call
          # Define PORT as a constant outside of the method
          port = 12345
          # Create a server socket
          begin
            server = TCPServer.new(port)
          rescue Errno::EADDRINUSE
            puts "Port #{port} is already in use. Trying another port..."
            port += 1
            retry
          end
          
          # Listen for incoming connections
          puts "Server listening on port #{port}"
          loop do
            # Accept incoming connection
            client = server.accept
            
            # Receive data
            data = client.gets
            
            # Display received data
            puts "Received: #{data}"
            
            # Optionally send a response
            client.puts "Received your data: #{data}"
            
            # Close the connection
            client.close
          end
        end
      end
    end
  end
end
