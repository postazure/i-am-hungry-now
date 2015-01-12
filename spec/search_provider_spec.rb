require "JSON"
require "RestClient"
require "search_provider"

describe SearchProvider do
  describe "#initialize" do
    xit "no address doesn't error out" do
      search = SearchProvider.new
      expect(search.address).to eq nil
      expect(search.class).to eq SearchProvider
    end
    it "has address" do
      search = SearchProvider.new("94117")
      expect(search.address.class).to eq Address
    end
  end

  describe "Not implemented" do
    let(:search) {SearchProvider.new}
    it "find_by_name" do
      expect(search.find_by_name("test")).to eq(
      "find_by_name not implemented for this search provider")
    end
    it "find_by_id" do
      expect(search.find_by_id("test")).to eq(
      "find_by_id not implemented for this search provider")
    end
    it "search_by_keywords" do
      expect(search.search_by_keywords("test")).to eq(
      "search_by_keywords not implemented for this search provider")
    end
    it "search_by_location" do
      expect(search.search_by_location("test")).to eq(
      "search_by_location not implemented for this search provider")
    end
  end
end
