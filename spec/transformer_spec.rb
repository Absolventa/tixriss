require 'spec_helper'

describe Tixriss::Transformer do
  let(:input)  { File.read(File.join File.dirname(File.expand_path(__FILE__)), 'response.xml') }

  subject { Tixriss::Transformer.new input }

  describe 'its constructor' do
    it 'sets the input file' do
      subject = Tixriss::Transformer.new input
      subject.input.must_equal input
    end
  end

  describe '#write' do
    it 'has an html table' do
      html = Nokogiri::HTML(subject.output)

      html.css('table thead tr').size.must_equal 1
      html.css('table tbody tr').size.must_equal 2
    end
  end
end
