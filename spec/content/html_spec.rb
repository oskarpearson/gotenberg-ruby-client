# frozen_string_literal: true

RSpec.describe Gotenberg::Content::Html do
  let(:asset_1) { double(data: "one") }
  let(:asset_2) { double(data: "two") }
  let(:asset_3) { double(data: "three") }
  let(:asset_4) { double(data: "four") }
  let(:asset_5) { double(data: "five") }

  describe "initialisation" do
    it "accepts a list of assets" do
      subject = described_class.new([asset_1, asset_2, asset_3])
      expect(subject.assets).to eq([asset_1, asset_2, asset_3])
    end

    it "works without any assets" do
      subject = described_class.new
      expect(subject.assets).to eq([])
    end
  end

  describe "#add" do
    it "appends to the list of items supplied in the initialiser" do
      subject = described_class.new([asset_1, asset_2, asset_3])
      subject.add(asset_4)
      subject.add(asset_5)
      expect(subject.assets).to eq([asset_1, asset_2, asset_3, asset_4, asset_5])
    end

    it "works when no items were supplied to the initialiser" do
      subject = described_class.new
      subject.add(asset_4)
      subject.add(asset_5)
      expect(subject.assets).to eq([asset_4, asset_5])
    end
  end

  describe "#reset!" do
    it "clears out any items in the asset list" do
      subject = described_class.new([asset_1, asset_2, asset_3])
      subject.add(asset_4)
      subject.add(asset_5)

      expect {
        subject.reset!
      }.to change {
        subject.assets
      }.from(
        [asset_1, asset_2, asset_3, asset_4, asset_5]
      ).to(
        []
      )
    end
  end

  describe "#action_suffix" do
    it "returns 'html'" do
      expect(subject.action_suffix).to eq("html")
    end
  end

  describe "#payload" do
    it "returns files containing data from each asset" do
      subject = described_class.new([asset_1, asset_2, asset_3])
      subject.add(asset_4)
      subject.add(asset_5)

      expect(subject.payload).to eq(
        files: [
          "one",
          "two",
          "three",
          "four",
          "five",
        ]
      )
    end
  end
end
