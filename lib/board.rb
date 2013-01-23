# Conway's Game of Life
# Constraints:
# 1) No naked primatives
# 2) No more than three arguments
# 3) No more than 4 lines per code per method
# 4) No more than 50 lines per class
# 5) Uniform access of instance variables

require 'dimensions'

class Row
  include Enumerable

  def initialize
    @cells = []
  end

  attr_reader :cells

  def add_cell(cell)
    cells << cell
  end
end

class Board
  class BoardBuilder
    def initialize(board, dimensions)
      @board = board
      @dimensions = dimensions
    end

    attr_reader :board, :dimensions

    def call(&block)
      dimensions.each_row do |row_index, column_count|
        row = Row.new
        board.add_row row
        RowBuilder.new(row, row_index, column_count).call(&block)
      end
    end
  end

  attr_reader :rows

  def self.build(dimensions, &block)
    allocate.tap do |board|
      BoardBuilder.new(board, dimensions).call(&block)
    end
  end

  def rows
    @rows ||= []
  end

  def add_row(row)
    rows << row
  end

  def row_count
    rows.length
  end
end

class RowBuilder
  def initialize(row, row_index, col_count)
    @row = row
    @row_index = row_index
    @col_count = col_count
  end

  attr_reader :row, :row_index, :col_count

  def call(&block)
    col_count.times do |col_index|
      row.add_cell block.call(row_index, col_index)
    end
  end
end
