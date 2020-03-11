require 'bundler/setup'
require_relative 'config'
require_relative 'board'
require_relative 'next_visit'
require_relative 'tile'

include NextVisit
include Board

class Visit
  def self.process(args)
    unless valid_args?(args)
      puts "------Row and Col values range should be within 0 to #{BOARD_SIZE - 1}------"
      raise 'Invalid Argument'
    end

    tile = Tile.new(args[0].to_i, args[1].to_i)
    board = Array.new(BOARD_SIZE * BOARD_SIZE, -1)

    # initial visit
    board[tile.col * BOARD_SIZE + tile.row] = 1

    (0...(BOARD_SIZE * BOARD_SIZE - 1)).each do |_i|
      next_tile = start_visit(board, tile)
      return false if next_tile.nil?
    end

    print_board(board)
    true
  end

  def self.print_board(board)
    (0...BOARD_SIZE).each do |i|
      (0...BOARD_SIZE).each do |j|
        print "#{board[j * BOARD_SIZE + i]} \t"
      end
      puts "\n"
    end
  end

  # Check the arguments are within the range
  def self.valid_args?(args)
    (0..BOARD_SIZE - 1).include?(args[0].to_i) &&
      (0..BOARD_SIZE - 1).include?(args[1].to_i)
  end
end

until Visit.process(ARGV)
end
