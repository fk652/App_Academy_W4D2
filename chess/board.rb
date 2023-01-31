require_relative "piece"

class Board
  def initialize
    @null_piece = NullPiece.new
    @rows = Array.new(8) { Array.new(8, @null_piece) }  # change to NullPiece later
    setup_board
  end

  def setup_board
    row_indexes = [0, 1, 6, 7]
    row_indexes.each do |row_idx|
      (0..7).each do |col_idx|
        pos = [row_idx, col_idx]
        self[pos] = Piece.new
      end
    end
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @rows[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    raise "there is no piece at #{start_pos}" if self[start_pos] == nil
    # raise "the piece cannot move to #{end_pos}" if !valid_pos?(end_pos)
    piece = self[start_pos]
    self[start_pos] = @null_piece # change to NullPiece later
    self[end_pos] = piece
  end

  private

end