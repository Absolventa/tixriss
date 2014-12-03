require 'net/http'

module Tixriss
  class Request
    attr_reader :domain, :key

    def initialize(domain: nil, key: nil)
      @domain, @key = domain, key
    end

    def response
      @response ||= get
    end

    def get
      Net::HTTP.get uri
    end

    def uri
      @uri ||= URI("http://api.sistrix.net/links.list?#{parameters}")
    end

    def parameters
      "api_key=#{key}&domain=#{domain}"
    end
  end
end
