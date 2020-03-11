require 'rspec'
require_relative '../lib/config'
require_relative '../lib/visit'
require_relative '../lib/board'
require_relative '../lib/next_visit'
require_relative '../lib/tile'

include NextVisit
include Board

RSpec.describe 'PawnTour' do
  describe 'Visit' do
    context 'With valid Arguments' do
      it 'Should return true' do
        expect(Visit.process([3, 4])).to eq(true)
      end
    end
    context 'With Invalid Arguments' do
      it 'Should raise error' do
        expect { Visit.process([31, 4]) }.to raise_error(RuntimeError, 'Invalid Argument')
      end
    end
  end

  describe 'Next Visit' do
    context 'With valid Arguments' do
      it 'should return tile instance' do
        tile = Tile.new(3, 4)
        board = Array.new(BOARD_SIZE * BOARD_SIZE, -1)
        tile = start_visit(board, tile)
        expect(tile.instance_of?(Tile)).to eq(true)
      end
    end

    context 'with Invalid Arguments' do
      it 'should return nil' do
        tile = Tile.new(20, 4)
        board = Array.new(BOARD_SIZE * BOARD_SIZE, -1)
        tile = start_visit(board, tile)
        expect(tile.instance_of?(Tile)).to eq(false)
        expect(tile).to be_nil
      end
    end
  end

  describe "Board" do
    context 'empty and degree' do
      it "Should return true and has degree" do
        board = Array.new(BOARD_SIZE * BOARD_SIZE, -1)
        expect(empty?(board, 3,2)).to eq(true)
        expect(degree(board, 3,2)).to eq(7)
      end

      it "Should return false and no degree" do
        board = Array.new(BOARD_SIZE * BOARD_SIZE, 20)
        expect(empty?(board, 3,2)).to eq(false)
        expect(degree(board, 3,2)).to eq(0)
      end

    end
  end
end
