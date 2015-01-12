require "JSON"
require "RestClient"
require "search_provider"
require "order_ahead_provider"
require "restaurant"

describe Restaurant do
  describe "data from OrderAheadProvider" do
    let(:oa_search) {OrderAheadProvider.new}
    it "#name" do
      restaurant = oa_search.find_by_name("Best of Thai Noodle")
      expect(restaurant.name).to eq "Best of Thai Noodle"
    end
    it "#phone_number" do
      restaurant = oa_search.find_by_name("Best of Thai Noodle")
      expect(restaurant.phone_number).to eq "415-552-3534"
    end
  end
end
