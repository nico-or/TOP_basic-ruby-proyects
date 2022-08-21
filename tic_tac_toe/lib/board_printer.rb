class BoardPrinter
  attr_accessor :board

  def show
    puts "  #{header}"
    puts "  #{divisor}"
    board.each.with_index do |row, index|
      puts "#{row_index(index)} |#{format_row(row)}|"
      puts "  #{divisor}"
    end
  end

  private

  def board_rows
    board.length
  end

  def board_cols
    board.first.length
  end

  def header
    range = 0.upto(board_cols - 1)
    row = range.map { |i| ('a'.ord + i).chr }
               .map { |char| " #{char} " }
               .join(' ')
    " #{row} ".rstrip
  end

  def divisor
    n = board_cols + 1
    n.times.map { '+' }
           .join('---')
  end

  def format_cell(cell)
    cell.nil? ? ' ' : cell
  end

  def format_row(row)
    tmp = row.map { format_cell(_1) }
             .join(' | ')
    " #{tmp} "
  end

  def row_index(index)
    index + 1
  end
end
