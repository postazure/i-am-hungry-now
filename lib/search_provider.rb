class SearchProvider
  attr_reader :address
  def initialize address=nil
    return "No address input" if address.nil?
    @address = Address.new(address)
  end

  def find_by_name restaurant
    raise "find_by_name not implemented for this search provider"
  end

  def find_by_id restaurant_id
    raise "find_by_id not implemented for this search provider"
  end

  def search_by_keywords keywords_array
    raise "search_by_keywords not implemented for this search provider"
  end

  def search_by_location address=@address
    raise "search_by_location not implemented for this search provider"
  end
  private
  def fetch_data search_url
    raw_json = RestClient.get(search_url)
    JSON.parse(raw_json.body)
  end
end
