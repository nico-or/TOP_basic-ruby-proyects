class Calculator
  def add(*values)
    values.reduce(:+)
  end
end
