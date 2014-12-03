require 'spec_helper'

describe Tixriss::Request do
  let(:api_key)  { SecureRandom.hex 8 }
  let(:domain)   { 'absolventa.de' }
  let(:response) { File.read(File.join File.dirname(File.expand_path(__FILE__)), 'response.xml') }

  subject { Tixriss::Request.new domain: domain, key: api_key }

  describe 'its constructor' do
    it 'sets the api key' do
      subject = Tixriss::Request.new key: api_key
      subject.key.must_equal api_key
    end

    it 'sets the domain' do
      subject = Tixriss::Request.new domain: domain
      subject.domain.must_equal domain
    end
  end

  describe '#get' do
    before do
      get_parameters = "api_key=#{api_key}&domain=#{domain}"
      stub_request(:get, "http://api.sistrix.net/links.list?#{get_parameters}").
        to_return(body: response)
    end

    it 'returns the xml on success' do
      subject.get.must_equal response
    end

    it 'caches the result as #response' do
      subject.response.must_equal response
      WebMock.reset! # Makes webmock fail hard if another request is made
      subject.response.must_equal response
    end

  end

end
