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

    attr_reader :params, :response, :base_uri, :req

    def initialize
      @base_uri = URI.parse(Speedio.config.base_url)
    end

    def post(params, type = :message)
      @params = params
      @req    = request(type)

      request_and_parse
    end

    def messages(params, type = :message)
      @params = params
      @req    = Net::HTTP::Get.new uri(type, get_params)

      request_and_parse
    end

    private

    def request_and_parse
      set_token

      @response = session.request(req)
      return parse_response if response.code.to_i < 400

      raise Error, 'Invalid request'
    end

    def set_token
      req['HTTP-X-AUTH-TOKEN'] = Speedio.config.token
    end

    def uri(type, params = nil)
      uri = URI.parse("#{base_uri}#{PATH[type]}")
      uri.query = URI.encode_www_form(params) if params
      uri
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

    def get_params
      {
        last_message_timestamp: params[:timestamp],
        contact_number:         params[:from]
      }
    end

    def session
      @session ||= Net::HTTP.new(base_uri.host, base_uri.port)
    end
  end
end
