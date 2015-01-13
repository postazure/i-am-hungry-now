class OrderAheadCrawler
  def initialize(address_str)
    @address_str = address_str
  end
  def search_by_location
    new_search = OrderAheadProvider.new(@address_str)
    @stores = new_search.search_by_location
  end
  def shortest_delivery_time(x)
    sort_by_delivery
    @stores[0..x-1]
  end

  private
  def sort_by_delivery
    loops = @stores.length-1

    loops.times do
      loops.times do |i|
        if @stores[i].delivery_time_min >= @stores[i+1].delivery_time_min
          @stores[i], @stores[i+1] = @stores[i+1], @stores[i]
        end
      end
    end

  end
end
