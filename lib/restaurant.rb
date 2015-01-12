class Restaurant
  attr_reader :name,
    :phone_number,
    :delivery_time_min,
    :delivery_time_max,
    :source_name,
    :source_url,
    :logo,
    :yelp_url

  def initialize data
    @data = data
    @name = data["name"]
    @phone_number = data["phone_number"]
    @delivery_time_min = data["min_delivery_time"]
    @delivery_time_max = data["max_delivery_time"]
    @source_name = data["source_name"]
    @source_url = data["source_url"]
    @logo = data["logo"]
    @yelp_url = data["yelp_url"]
  end
  
  def accepting_orders?
    @data["accepting_orders"]
  end
end
