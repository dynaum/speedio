module Speedio
  class Config
    include Singleton

    attr_accessor :base_url, :token, :timeout, :connect_timeout

    def base_url
      @base_url || ENV['SPEEDIO_BASE_URL']
    end

    def token
      @token || ENV['SPEEDIO_TOKEN']
    end

    def timeout
      @timeout || 10
    end

    def connect_timeout
      @connect_timeout || 5
    end
  end
end
