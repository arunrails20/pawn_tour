class Tile
  attr_accessor :row, :col

  def initialize(row, col)
    @row = row
    @col = col
  end

  def row_pattern(index)
    row + ROW_PATTERN[index]
  end

  def col_pattern(index)
    col + COL_PATTERN[index]
  end

  def update_next_point!(next_row, next_col)
    self.row = next_row
    self.col = next_col
  end

  def update_board!(board, next_row, next_col)
    board[next_col * BOARD_SIZE + next_row] = board[col * BOARD_SIZE + row] + 1
  end
end
