# frozen_string_literal: true

module Gotenberg
  class Asset
    def initialize(filename, content_type, string_or_io)
      @filename = filename
      @content_type = content_type
      @string_or_io = string_or_io
    end

    def data
      UploadIO.new(io, content_type, filename)
    end

    private

      attr_reader :filename, :content_type, :string_or_io

      def io
        if string_or_io.kind_of?(String)
          StringIO.new(string_or_io)
        else
          string_or_io
        end
      end
  end
end
