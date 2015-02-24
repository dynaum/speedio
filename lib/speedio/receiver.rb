module Speedio
  class Receiver
    attr_reader :from, :timestamp

    def initialize(from, timestamp = '1')
      @from, @timestamp = from, timestamp
    end

    def all
      request.messages params
    end

    private

    def params
      { from: from, timestamp: timestamp }
    end

    def request
      @request ||= Request.new
    end
  end
end
