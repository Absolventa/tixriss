module Tixriss
  class Request
    attr_reader :domain, :key

    def initialize(domain: nil, key: nil)
      @domain, @key = domain, key
    end
  end
end
