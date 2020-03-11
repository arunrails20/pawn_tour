module NextVisit
  # will return next tile obj
  def start_visit(board, tile)
    min_counter = -1
    min_deg = BOARD_SIZE + 1
    next_row = nil
    next_col = nil
    degree = nil
    initial_start = rand_start

    (0...ROW_PATTERN.length).each do |count|
      i = (initial_start + count) % ROW_PATTERN.length
      next_row = tile.row_pattern(i)
      next_col = tile.col_pattern(i)
      # get minimum degree and check the next visit is legal.
      if empty?(board, next_row, next_col) && (degree = degree(board, next_row, next_col)) < min_deg
        min_counter = i
        min_deg = degree
      end
    end

    return nil if min_counter == -1

    next_row = tile.row_pattern(min_counter)
    next_col = tile.col_pattern(min_counter)

    tile.update_board!(board, next_row, next_col)

    # update tile obj with next row and col
    tile.update_next_point!(next_row, next_col)

    tile
  end

  def rand_start
    rand(100..1000) % ROW_PATTERN.length
  end
end
