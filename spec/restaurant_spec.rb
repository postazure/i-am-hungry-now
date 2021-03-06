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
      #puts "Delivery Min #{restaurant.delivery_time_min}"
      expect(restaurant.delivery_time_min).to be > 20
    end
    it "#delivery_time_max" do
      restaurant = oa_search.find_by_name("Best of Thai Noodle")
      #puts "Delivery Max #{restaurant.delivery_time_max}"
      expect(restaurant.delivery_time_max).to be > restaurant.delivery_time_min
    end
    it "#accepting_orders?" do
      restaurant = oa_search.find_by_name("Best of Thai Noodle")
      if Time.now.hour >= 11
        expect(restaurant.accepting_orders?).to be true
      else
        expect(restaurant.accepting_orders?).to be false
      end
    end
    it "#source_name" do
      restaurant = oa_search.find_by_name("Best of Thai Noodle")
      expect(restaurant.source_name).to eq "OrderAhead"
    end
    it "#source_url" do
      restaurant = oa_search.find_by_name("Best of Thai Noodle")
      expect(restaurant.source_url).to eq "https://www.orderaheadapp.com/places/best-of-thai-noodle--san-francisco-ca"
    end
    it "#logo" do
      restaurant = oa_search.find_by_name("Best of Thai Noodle")
      expect(restaurant.logo).to eq "https://orderahead-production.s3.amazonaws.com/uploads/store/logo/733/thumb_best_of_thai.png"
    end
    it "#yelp_url" do
      restaurant = oa_search.find_by_name("Best of Thai Noodle")
      expect(restaurant.yelp_url).to eq "http://www.yelp.com/biz/best-of-thai-noodle-san-francisco"
    end
  end
end
