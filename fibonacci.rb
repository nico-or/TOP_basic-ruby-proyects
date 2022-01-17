def fibs(n)
  out = []
  0.upto(n) do |i|
    if i <= 1
      out << i
    else
      out << out[i-1] + out[i-2]
    end
  out
end

pp fibs(0) == [0]
pp fibs(1) == [0, 1]
pp fibs(2) == [0, 1, 1]
pp fibs(10)

def fibs_rec(n, out = [])
  return 0.upto(n).to_a if n <= 1
  array = fibs(n-1)
  array << array[-2] + array[-1]
end

pp fibs_rec(0) == [0]
pp fibs_rec(1) == [0, 1]
pp fibs_rec(2) == [0, 1, 1]
pp fibs_rec(10)
