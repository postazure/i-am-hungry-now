class Restaurant
  attr_reader :name, :phone_number
  def initialize data
    @name = data["name"]
    @phone_number = data["phone_number"]
  end
end
