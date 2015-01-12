require "JSON"
require "RestClient"
require "search_provider"
require "order_ahead_provider"

describe OrderAheadProvider do
  it "inherits from SearchProvider" do
    oa_search = OrderAheadProvider.new("94117")
    expect(oa_search.address.class).to eq Address
  end

  describe "#find_by_name" do
    it "returns a json_hash if results" do
      oa_search = OrderAheadProvider.new("94117")
      restaurant = oa_search.find_by_name("Best of Thai Noodle")
      expect(restaurant.name).to include "Best of Thai Noodle"
      expect(restaurant.class).to be Restaurant
    end
  end
  describe "#find_by_id" do
    it "returns a json_hash if results" do
      oa_search = OrderAheadProvider.new("94117")
      restaurant = oa_search.find_by_id("733")
      expect(restaurant.name).to include "Best of Thai Noodle"
      expect(restaurant.class).to be Restaurant
    end
  end
  describe "#search_by_keywords" do
    it "search for restaurant name (exact name)" do
      oa_search = OrderAheadProvider.new("94117")
      search_array = oa_search.search_by_keywords("Best of Thai Noodle")
      expect(search_array.first.name).to include "Best of Thai Noodle"
      expect(search_array.length).to eq 1
      expect(search_array.class).to be Array
    end
    it "search for restaurant name (fuzzy name)" do
      oa_search = OrderAheadProvider.new("94117")
      search_array = oa_search.search_by_keywords("chicken")
      search_restaurant = search_array.find {|restaurant| restaurant.name == "Soul Groove"}

      expect(search_restaurant.name).to eq "Soul Groove"
      expect(search_array.length).to eq 5
      expect(search_array.class).to be Array
    end
  end

  describe "#search_by_location"
end
