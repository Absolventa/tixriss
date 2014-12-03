require 'spec_helper'
require 'open3'

describe 'the command line interface' do
  let(:inputfile) { File.join File.dirname(File.expand_path(__FILE__)), 'response.xml' }
  let(:response)  { File.read(inputfile) }

  before do
    stub_request(:get, "http://api.sistrix.net/*").to_return(body: response)
  end

  context 'called with insuffient arguments' do
    it 'displays usage information' do
      output, status = run_cli
      status.wont_equal 0
      output.must_match(/Usage/)
    end
  end

  context 'with persisted input' do
    it 'transforms the input to stdout' do
      output, status = run_cli(args: ["--input #{inputfile}"])

      output.must_match(/\A<html>/)
    end

    it 'writes transformed data to file' do
      outputfile = "./tix.html"

      output, status = run_cli(args: ["--input #{inputfile}", "--file #{outputfile}"])

      output.must_equal ''
      File.exists?(outputfile).must_equal true
      File.read(outputfile).must_match(/\A<html>/)

      FileUtils.rm outputfile
    end

    it 'allows piping of input data' do
      skip 'Feature not yet implemented'
    end

  end

  def run_cli(input = '', args: [])
    output, status = Open3.capture2("./bin/tisriss #{args.join(' ')}", stdin_data: '')
    [output, status.to_i]
  end
end
