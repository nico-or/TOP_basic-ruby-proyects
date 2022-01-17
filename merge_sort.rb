def merge(a, b)
  out = []
  until a.empty? || b.empty?
    foo = a.first < b.first ? a.shift : b.shift
    out << foo
  end

  if a.empty?
    b.each { |i| out << i }
  else
    a.each { |i| out << i }
  end

  out
end

puts "Testing merge(a, b)"
pp merge([0,2,3,6], [1,4,5]) == (0..6).to_a

def merge_sort(arr)
  return arr if arr.length == 1
  merge(
    merge_sort(arr[0...arr.length/2]),
    merge_sort(arr[arr.length/2..])
  )
end

puts "Testing merge_sort(a)"
array = (0..10).to_a.shuffle!
pp merge_sort(array) == array.sort

array = (-10..10).to_a.shuffle!
pp merge_sort(array) == array.sort
