class OrderAheadProvider < SearchProvider
  def initialize address=nil
    super
    @host = "https://www.orderaheadapp.com/"
    @host_suffix = "--san-francisco-ca.json"
    @lat_lon_query = "lat=#{@address.lat}&lon=#{@address.lng}"
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
    search_prefix = "/api/v1.0.6/stores/search/?query="
    delivery_suffix = "&page=1&per=60&ext=&delivers_to=true&pickup_at=&open_now=&" + @lat_lon_query
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
    restaurant_data["min_delivery_time"] = delivery_time(data) + data["min_delivery_time"]
    restaurant_data["max_delivery_time"] = delivery_time(data) + data["max_delivery_time"]
    restaurant_data["accepting_orders"] = accepting_orders(data)
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

  def delivery_time data
    #store_scaling_delivery_attributes[(minute_increment * mile_interval)] #after address class
    sum = data["default_prep_duration"].nil? ? 0 : data["default_prep_duration"]
    sum += data["delivery_prep_bump"].nil? ? 0 : data["delivery_prep_bump"]
  end

  def accepting_orders data
    !data["not_accepting_orders"] && data["open_now?"]
  end
end
