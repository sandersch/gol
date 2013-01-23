class Dimensions < Struct.new(:row_count, :column_count)
  def each_row(&block)
    row_count.times do |row|
      block.call(row, column_count)
    end
  end
end
