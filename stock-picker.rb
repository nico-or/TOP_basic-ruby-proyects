def stock_picker(array)
  max_profit = 0
  out = []
  array.each_with_index do |price1, idx|
    price2 = array[idx + 1, array.length].max
    # && fixes error at last iteration when price2 = nil
    if price2 && (price2 - price1) > max_profit
      out = [idx, array.index(price2)]
      max_profit = price2 - price1
    end
  end
  out
end

# Test
puts stock_picker([17,3,6,9,15,8,6,1,10]) == [1, 4]