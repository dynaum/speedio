require "net/http"
require 'net/http/post/multipart'
require "uri"
require "json"

module Speedio
  class Request
    PATH = {
      message: "/messages.json",
      token:   "/tokens.json"
    }

    attr_reader :params, :response, :base_uri

    def initialize
      @base_uri = URI.parse(Speedio.config.base_url)
    end

    def post(params, type = :message)
      @params = params

      req = request(type)
      req['HTTP-X-AUTH-TOKEN'] = Speedio.config.token

      @response = session.request(req)

      if response.code.to_i < 400
        parse_response
      else
        raise Error, 'Invalid request'
      end
    end

    private

    def uri(type)
      URI.parse("#{base_uri}#{PATH[type]}")
    end

    def parse_response
      OpenStruct.new JSON.parse(response.body)
    end

    def request(type)
      Net::HTTP::Post::Multipart.new uri(type).path, req_params
    end

    def req_params
      {}.tap do |hash|
        hash['message[to]'] = params[:to] if params[:to]
        hash['message[content]'] = params[:content] if params[:content]
      end
    end

    def session
      @session ||= Net::HTTP.new(base_uri.host, base_uri.port)
    end
  end
end
