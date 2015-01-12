require "JSON"
require "RestClient"
require "Geocoder"
require "search_provider"
require "order_ahead_provider"
require "address"

describe Address do
  describe "convert from a zipcode"
  it "to longitude" do
    address = Address.new("94117")
    expect(address.lng).to eq "-122.4438929"
  end
  it "to latitude" do
    address = Address.new("94117")
    expect(address.lat).to eq "37.7717185"
  end
end
