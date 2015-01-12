class OrderAheadProvider < SearchProvider
  def initialize address=nil
    super
    @host = "https://www.orderaheadapp.com/places/"
    @host_suffix = "--san-francisco-ca.json"
  end

  def find_by_name restaurant_name
    data = {}

    search_name = restaurant_name.downcase.gsub(" ", "-")
    json_url = @host + search_name + @host_suffix
    search_return = fetch_data(json_url)
    data["name"] = search_return["name"]

    Restaurant.new(data)
  end
end
