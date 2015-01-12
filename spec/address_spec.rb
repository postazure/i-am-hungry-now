require "JSON"
require "RestClient"
require "Geocoder"
require "search_provider"
require "order_ahead_provider"
require "address"

describe Address do
  describe "convert from a zipcode" do
    it "to longitude" do
      address = Address.new("94117")
      expect(address.lng).to eq "-122.4438929"
    end
    it "to latitude" do
      address = Address.new("94117")
      expect(address.lat).to eq "37.7717185"
    end
  end

  describe "covert from an address" do
    it "to longitude" do
      address = Address.new("94105, 44 Tehama Street, San Francisco, CA 94105")
      expect(address.lng.to_f).to be_within(0.0005).of -122.3965866
    end
    it "to latitude" do
      address = Address.new("94105, 44 Tehama Street, San Francisco, CA 94105")
      expect(address.lat.to_f).to be_within(0.0005).of 37.7877445
    end
  end
end
