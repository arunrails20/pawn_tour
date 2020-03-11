module Board
  def empty?(board, row, col)
    limits(row, col) && (board[col * BOARD_SIZE + row] < 0)
  end

  def degree(board, row, col)
    count = 0
    (0...ROW_PATTERN.length).each do |i|
      count += 1 if empty?(board, row + ROW_PATTERN[i], col + COL_PATTERN[i])
    end
    count
  end

  def limits(row, col)
    ((row >= 0 && col >= 0) && (row < BOARD_SIZE && col < BOARD_SIZE))
  end
end
