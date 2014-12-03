require 'spec_helper'
require 'open3'

describe 'the command line interface' do

  context 'called without arguments' do
    it 'displays usage information' do
      output, status = run_cli
      status.wont_equal 0
      output.must_match(/Usage/)
    end
  end

  def run_cli(input = '')
    output, status = Open3.capture2('./bin/tisriss', stdin_data: '')
    [output, status.to_i]
  end
end
