def bubble_sort(array)
  sorted = array.clone
  loop do
    done = true
    sorted[0...sorted.length - 1].each_index do |idx|
      if sorted[idx] > sorted[idx+1]
        sorted[idx], sorted[idx+1] = sorted[idx+1], sorted[idx]
        done = false
      end
    end
    break if done
  end
  sorted
end

# Test
p bubble_sort([4,3,78,2,0,2]) == [0,2,2,3,4,78]
