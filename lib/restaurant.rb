class Restaurant
  attr_reader :name, :phone_number
  def initialize data
    @data = data
    @name = data["name"]
    @phone_number = data["phone_number"]
  end

  def delivery_time_min
    default_delivery + @data["min_delivery_time"]
  end
  def delivery_time_max
    default_delivery + @data["max_delivery_time"]
  end

  private
  def default_delivery
    sum = @data["default_prep_duration"] + @data["delivery_prep_bump"]
    #sum += store_scaling_delivery_attributes[(minute_increment * mile_interval)] #after address class
  end
end
