# frozen_string_literal: true

RSpec.describe Gotenberg::Client do
  let(:logger)        { double(info: nil) }
  let(:url_prefix)    { "http://localhost:3000" }

  let(:html_asset)    { Gotenberg::Asset.new("index.html", "text/html", "<html><head><title>Some data</title></head></html>") }
  let(:html_content)  { Gotenberg::Content::Html.new([html_asset]) }

  describe "#convert" do
    subject { Gotenberg::Client.new(url_prefix, logger) }

    it "generates a pdf" do
      VCR.use_cassette("html_conversion") do
        response = subject.convert(html_content)

        expect(response.content).to match(/^%PDF-/)
      end
    end
  end
end
