# spec/macos/logs/operations/create_spec.rb
# require 'spec_helper'
require 'date'
require 'tmpdir'
require 'fileutils'
require '../../../../app/services/mac/logs/operations/create'
# /Users/katelinkennedy/activity_tracker/spec/services/mac/logs/operations/create_spec.rb
# /Users/katelinkennedy/activity_tracker/app/services/mac/logs/operations/create.rb
RSpec.describe "Create File" do
  let(:subject)  { Mac::Logs::Operations::Create.new }
  
  describe '#call' do
    let(:operation) { subject.call(log_data) }
    let(:log_data) { { success: true } }
    
    it 'creates a CSV file with the correct data' do
      fixed_datetime = DateTime.new(2024, 2, 7, 15, 30, 0)
      allow(DateTime).to receive(:now).and_return(fixed_datetime)
      
      Dir.mktmpdir do |temp_dir|
        allow(Etc).to receive(:getlogin).and_return('testuser')
        
        log_input = { key1: 'value1', key2: 'value2' }
        
        operation.call(log_input)
        
        csv_file_path = File.join(temp_dir, 'Desktop', 'activity_logs', "#{fixed_datetime}.csv")
        expect(File.exist?(csv_file_path)).to be true
        
        csv_data = CSV.read(csv_file_path)
        expect(csv_data[0]).to eq(%w[user_name timestamp key1 key2])
        expect(csv_data[1][0]).to eq('testuser')
        expect(csv_data[1][1]).to eq(fixed_datetime.to_s)
        expect(csv_data[1][2]).to eq('value1')
        expect(csv_data[1][3]).to eq('value2')
      end
    end
  end
end
