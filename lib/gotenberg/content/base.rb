# frozen_string_literal: true

module Gotenberg
  module Content
    class Base
      attr_reader :assets

      def initialize(assets = [])
        @assets = assets
      end

      def add(item)
        @assets << item
      end

      def reset!
        @assets = []
      end

      def payload
        {
          files: @assets.map(&:data)
        }
      end
    end
  end
end
