# frozen_string_literal: true

RSpec.describe Gotenberg::Client do
  let(:url_prefix) { "http://localhost:3000" }

  describe "initialisation" do
    it "takes a url prefix" do
      described_class.new(url_prefix)
    end

    it "accepts a logger as the second argument" do
      logger = double

      described_class.new(url_prefix, logger)
    end
  end
end
