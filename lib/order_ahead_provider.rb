class OrderAheadProvider < SearchProvider
  def initialize address=nil
    super
    @host = "https://www.orderaheadapp.com/places/"
    @host_suffix = "--san-francisco-ca.json"
  end

  def find_by_name restaurant_name
    search_name = restaurant_name.downcase.gsub(" ", "-")
    json_url = @host + search_name + @host_suffix
    search_results = fetch_data(json_url)
    Restaurant.new(return_data(search_results))
  end

  def find_by_id restaurant_id
    find_by_name(restaurant_id)
  end

  private
  def return_data data
    restaurant_data = {}
    restaurant_data["name"] = data["name"]
    restaurant_data["phone_number"] = data["phone_number"]
    return restaurant_data
  end
end
