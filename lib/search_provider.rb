class SearchProvider
  attr_reader :address
  def initialize address=nil
    return "No address input" if address.nil?
    @address = address
  end

  def find_by_name restaurant
    "find_by_name not implemented for this search provider"
  end

  def find_by_id restaurant_id
    "find_by_id not implemented for this search provider"
  end

  def search_by_keywords keywords_array
    "search_by_keywords not implemented for this search provider"
  end

  def search_by_location address=@address
    "search_by_location not implemented for this search provider"
  end
end
