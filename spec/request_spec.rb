require 'spec_helper'

describe Tixriss::Request do
  let(:api_key) { SecureRandom.hex 8 }
  let(:domain)  { 'absolventa.de' }

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

end
