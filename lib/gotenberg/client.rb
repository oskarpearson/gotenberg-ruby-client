# frozen_string_literal: true

module Gotenberg
  class Client
    def initialize(url_prefix, logger = nil)
      @url_prefix = url_prefix
      @logger = logger
    end

    def convert(content)
      Response.new(
        http_call(content)
      )
    end

    private

      attr_reader :url_prefix, :logger

      def connection
        @connection ||= Faraday.new do |conn|
          conn.request(:multipart)
          conn.request(:url_encoded)

          conn.response(:logger, logger) if logger
        end
      end

      def http_call(content)
        uri = URI::join(url_prefix, "convert/", content.action_suffix)

        connection.post do |req|
          req.url(uri)

          req.body = content.payload
        end
      end
  end
end
