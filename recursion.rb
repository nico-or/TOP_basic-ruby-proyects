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
