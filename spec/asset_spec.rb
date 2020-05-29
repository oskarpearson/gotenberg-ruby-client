# frozen_string_literal: true

require "tempfile"

RSpec.describe Gotenberg::Asset do
  let(:filename) { "index.html" }
  let(:content_type) { "text/html" }
  let(:string) { "<html></html>" }

  describe "with a string" do
    subject { described_class.new(filename, content_type, string) }

    it "returns an UploadIO object with the string data" do
      data = subject.data

      expect(data.original_filename).to eq(filename)
      expect(data.content_type).to eq(content_type)

      io = data.io
      expect(io.read).to eq(string)
    end
  end

  describe "with a file io object" do
    let!(:tempfile) do
      file = Tempfile.new("gotenberg-rspec-asset")
      file.write(string)
      file.rewind

      file
    end

    after do
      tempfile.close
      tempfile.unlink
    end

    subject { described_class.new(filename, content_type, tempfile) }

    it "returns an UploadIO object with the content from the string" do
      data = subject.data

      expect(data.original_filename).to eq(filename)
      expect(data.content_type).to eq(content_type)

      io = data.io
      expect(io.read).to eq(string)
    end
  end
end
