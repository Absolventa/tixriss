require 'spec_helper'

describe Tixriss::Transformer do
  let(:input)  { File.read(File.join File.dirname(File.expand_path(__FILE__)), 'response.xml') }
  let(:output) { './transformer.out.html' }

  subject { Tixriss::Transformer.new input: input, output: output }

  after do
    FileUtils.rm output if File.exists?(output)
  end

  describe 'its constructor' do
    it 'sets the input file' do
      subject = Tixriss::Transformer.new input: input
      subject.input.must_equal input
    end

    it 'sets the output file' do
      subject = Tixriss::Transformer.new output: output
      subject.output.must_equal output
    end
  end

  describe '#write' do
    before { subject.write }

    it 'creates a file' do
      File.exists?(subject.output).must_equal true
    end

    it 'has an html table' do
      html = Nokogiri::HTML(File.read output)

      html.css('table thead tr').size.must_equal 1
      html.css('table tbody tr').size.must_equal 2
    end
  end
end
