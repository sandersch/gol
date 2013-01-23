# Conway's Game of Life
# Constraints:
# 1) No naked primatives
# 2) No more than three arguments
# 3) No more than 4 lines per code per method
# 4) No more than 50 lines per class
# 5) Uniform access of instance variables

class Board
  attr_reader :rows

  def self.build(rows, cols)
    allocate.tap do |board|
      board.set_rows(rows)
    end
  end
  
  def set_rows(rows)
    @rows = rows
  end

  def row_count
    rows || 0
  end
end
