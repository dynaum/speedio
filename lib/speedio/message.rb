module Speedio
  class Message
    attr_reader :to, :message

    def initialize(to, message)
      @to, @message = to, message
    end

    def send
      request.post post_params
    end

    private

    def post_params
      { to: to, content: message }.delete_if { |k,v| v.nil? }
    end

    def request
      @request ||= Request.new
    end
  end
end
