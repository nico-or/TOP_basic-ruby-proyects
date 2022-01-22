class Calculator
  def add(*values)
    values.reduce(:+)
  end

  def subtract(*values)
    values.reduce(:-)
  end

  def multiply(*values)
    values.reduce(:*)
  end
end
