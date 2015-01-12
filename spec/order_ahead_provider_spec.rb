require "JSON"
require "RestClient"
require "search_provider"
require "order_ahead_provider"

describe OrderAheadProvider do
  it "inherits from SearchProvider" do
    oa_search = OrderAheadProvider.new("12345")
    expect(oa_search.address).to eq "12345"
  end

  describe "#find_by_name" do
    it "returns a json_hash" do
      oa_search = OrderAheadProvider.new
      json_hash = oa_search.find_by_name("Best of Thai Noodle")
      expect(json_hash["name"]).to include "Best of Thai Noodle"
    end
  end
end
