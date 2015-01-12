class Address
  attr_reader :lng, :lat
  def initialize address_string
    @data = Geocoder.search(address_string).first.data
    @lng = geo_coords["lng"].to_s
    @lat = geo_coords["lat"].to_s
  end

  private
  def geo_coords
    @data["geometry"]["location"]
  end
end
