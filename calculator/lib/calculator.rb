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

  def divide(*values)
    values.map(&:to_f).reduce(:/)
  end
end
