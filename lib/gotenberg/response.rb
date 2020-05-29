# frozen_string_literal: true

module Gotenberg
  class Response
    def initialize(faraday_response)
      @faraday_response = faraday_response
    end

    def content
      faraday_response.body
    end

    private

      attr_reader :faraday_response
  end
end
