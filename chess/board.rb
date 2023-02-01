require_relative "piece"

class Board
  attr_accessor :rows

  def initialize
    @null_piece = NullPiece.instance
    @rows = Array.new(8) { Array.new(8, @null_piece) }
    setup_board
  end

  def setup_board
    row_indexes = [0, 1, 6, 7]
    row_indexes.each do |row_idx|
      if row_idx == 1 || row_idx == 6   # row of pawns
        # (0..7).each do |col_idx|
        #   pos = [row_idx, col_idx]
        #   color = (row_idx == 1 ? :white : :black)
        #   self[pos] = Pawn.new(color, self, pos)
        # end
      else  # row of chess pieces
        color = (row_idx == 0 ? :white : :black)
        self[[row_idx, 0]] = Rook.new(color, self, [row_idx, 0])
        self[[row_idx, 1]] = Knight.new(color, self, [row_idx, 1])
        self[[row_idx, 2]] = Bishop.new(color, self, [row_idx, 2])
        self[[row_idx, 3]] = Queen.new(color, self, [row_idx, 3])
        self[[row_idx, 4]] = King.new(color, self, [row_idx, 4])
        self[[row_idx, 5]] = Bishop.new(color, self, [row_idx, 5])
        self[[row_idx, 6]] = Knight.new(color, self, [row_idx, 6])
        self[[row_idx, 7]] = Rook.new(color, self, [row_idx, 7])
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
    self[start_pos] = @null_piece
    self[end_pos] = piece
  end

  private

end