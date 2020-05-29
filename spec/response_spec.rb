# frozen_string_literal: true

RSpec.describe Gotenberg::Response do
  let(:faraday_response) { double(body: "The body") }

  subject { described_class.new(faraday_response) }

  describe "#content" do
    it "returns the faraday response body" do
      expect(subject.content).to eq("The body")
    end
  end
end
