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
    it "returns a json_hash if results" do
      oa_search = OrderAheadProvider.new
      restaurant = oa_search.find_by_name("Best of Thai Noodle")
      expect(restaurant.name).to include "Best of Thai Noodle"
      expect(restaurant.class).to be Restaurant
    end
  end
  describe "#find_by_id" do
    it "returns a json_hash if results" do
      oa_search = OrderAheadProvider.new
      restaurant = oa_search.find_by_id("733")
      expect(restaurant.name).to include "Best of Thai Noodle"
      expect(restaurant.class).to be Restaurant
    end
  end
end
