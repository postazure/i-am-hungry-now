class OrderAheadProvider < SearchProvider
  def initialize address=nil
    super
    @host = "https://www.orderaheadapp.com/"
    @host_suffix = "--san-francisco-ca.json"
  end

  def find_by_name restaurant_name
    find_prefix = "places/"
    search_name = restaurant_name.downcase.gsub(" ", "-")
    json_url = @host + find_prefix + search_name + @host_suffix
    search_results = fetch_data(json_url)
    convert_to_restaurant_obj(search_results)
  end

  def find_by_id restaurant_id
    find_by_name(restaurant_id)
  end

  def search_by_keywords keywords_array
    delivery_suffix = "&page=1&per=60&ext=&delivers_to=true&pickup_at=&open_now=&" + address
    search_prefix = "/api/v1.0.6/stores/search/?query="
    search_term = keywords_array.gsub(" ", "+").downcase

    search_url = @host + search_prefix + search_term + delivery_suffix
    search_results = fetch_data(search_url)

    if redirected_to_restaurant?(search_results)
      return [convert_to_restaurant_obj(search_results)]
    else
      return parse_search_json(search_results)
    end
  end

  private
  def convert_to_restaurant_obj data
    restaurant_data = {}
    restaurant_data["name"] = data["name"]
    restaurant_data["phone_number"] = data["phone_number"]
    Restaurant.new(restaurant_data)
  end

  def redirected_to_restaurant? data
    !data.has_key?("per_page")
  end

  def parse_search_json search_results
    restaurants = []
    search_results["stores"].each do |store|
      restaurants << convert_to_restaurant_obj(store)
    end
    restaurants
  end
end
