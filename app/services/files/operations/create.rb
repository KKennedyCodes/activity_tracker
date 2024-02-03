# frozen_string_literal: true

module Files
  module Operations
    class Create
      include DryOperation
      
      option :file_type, type: Types::String
      option :name, type: Types::String
      option :path, type: Types::String
      
      def call
      end
      
      private
      
    end
  end
end