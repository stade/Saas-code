class CartesianProduct
  include Enumerable

  attr_accessor :cartesian_array

  def initialize(firstarr, secondarr)

    @cartesian_array = Array.new

    if firstarr.count == 0 && secondarr.count == 0
      return
    elsif
      max_index_first = firstarr.count-1
      max_index_second = secondarr.count-1
      first = firstarr
      second = secondarr
      current_index_first = 0
      current_index_second = 0

      while max_index_first >= current_index_first
        while max_index_second >= current_index_second
          @cartesian_array.push([first[current_index_first], second[current_index_second]])
          current_index_second += 1
        end
        current_index_second = 0
        current_index_first += 1
      end
    end
  end

  def each
    max_index = self.cartesian_array.count-1
    first = @cartesian_array
    current_index = 0
    while max_index >= current_index
      yield self.cartesian_array[current_index]
      current_index += 1
    end
  end
end


#c = CartesianProduct.new([:a,:b], [4,5])

#c.each { |elt| puts elt.inspect }
#[:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]




#c = CartesianProduct.new([:a,:b], [])
#c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)

