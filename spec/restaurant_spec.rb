require "JSON"
require "RestClient"
require "search_provider"
require "order_ahead_provider"
require "restaurant"

describe Restaurant do
  describe "data from OrderAheadProvider" do
    let(:oa_search) {OrderAheadProvider.new("94117")}
    it "#name" do
      restaurant = oa_search.find_by_name("Best of Thai Noodle")
      expect(restaurant.name).to eq "Best of Thai Noodle"
    end
    it "#phone_number" do
      restaurant = oa_search.find_by_name("Best of Thai Noodle")
      expect(restaurant.phone_number).to eq "415-552-3534"
    end
    it "#delivery_time_min" do
      restaurant = oa_search.find_by_name("Best of Thai Noodle")
      puts "Delivery Min #{restaurant.delivery_time_min}"
      expect(restaurant.delivery_time_min).to be > 0
    end
    it "#delivery_time_max" do
      restaurant = oa_search.find_by_name("Best of Thai Noodle")
      puts "Delivery Max #{restaurant.delivery_time_max}"
      expect(restaurant.delivery_time_max).to be > 0
    end
    it "#accepting_orders?" do
      restaurant = oa_search.find_by_name("Best of Thai Noodle")
      expect(restaurant.accepting_orders?).to be false
    end
  end
end
