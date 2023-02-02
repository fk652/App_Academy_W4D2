require_relative "piece"

class Board
  attr_accessor :rows, :white_pieces, :black_pieces

  def initialize
    @null_piece = NullPiece.instance
    @rows = Array.new(8) { Array.new(8, @null_piece) }
    @white_pieces = []
    @black_pieces = []
    setup_board

  end

  def setup_board
    row_indexes = [0, 1, 6, 7]
    row_indexes.each do |row_idx|
      color = (row_idx == 0 || row_idx == 1 ? :white : :black)
      pieces_arr = (color == :white ? white_pieces : black_pieces)
      if row_idx == 1 || row_idx == 6   # row of pawns
        (0..7).each do |col_idx|
          pos = [row_idx, col_idx]
          self[pos] = Pawn.new(color, self, pos)
          pieces_arr << self[pos]
        end
      else  # row of chess pieces
        self[[row_idx, 0]] = Rook.new(color, self, [row_idx, 0])
        self[[row_idx, 1]] = Knight.new(color, self, [row_idx, 1])
        self[[row_idx, 2]] = Bishop.new(color, self, [row_idx, 2])
        self[[row_idx, 3]] = Queen.new(color, self, [row_idx, 3])
        self[[row_idx, 4]] = King.new(color, self, [row_idx, 4])
        self[[row_idx, 5]] = Bishop.new(color, self, [row_idx, 5])
        self[[row_idx, 6]] = Knight.new(color, self, [row_idx, 6])
        self[[row_idx, 7]] = Rook.new(color, self, [row_idx, 7])
        (0..7).each do |col_idx|
          pieces_arr << self[[row_idx, col_idx]]
        end
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
    piece = self[start_pos]
    raise "there is no piece at #{start_pos}" if piece.empty?
    raise "the piece cannot move to #{end_pos}" if !piece.valid_moves.include?(end_pos)

    self[start_pos] = @null_piece
    capture(end_pos) if piece.enemy?(end_pos)
    self[end_pos] = piece
    piece.pos = end_pos
    render
  end

  def capture(end_pos)
    captured_piece = self[end_pos]
    pieces_arr = (captured_piece.color == :white ? white_pieces : black_pieces)
    pieces_arr.delete(captured_piece)
  end

  def render
    rows.each do |row|
      puts row.join(' ')
    end
    nil
  end

  def inspect
    ""
  end

  def find_king(color)
    # (0..rows.length).each do |row_idx|
    #   (0..rows[0].length).each do |col_idx|
    #     pos = [row_idx, col_idx]
    #     piece = self[pos]
    #     return pos if piece.is_a?(King) && piece.color == color
    #   end
    # end

    pieces_arr = (color == :white ? white_pieces : black_pieces)
    king = pieces_arr.find { |piece| piece.is_a? King }
  end

  def in_check?(color)
    king_pos = find_king(color).pos
    enemy_pieces = (color == :white ? black_pieces : white_pieces)
    enemy_pieces.any? { |piece| piece.moves.include?(king_pos) }
  end

  def check_mate?(color)
    king_moves = find_king(color).moves
    return false if king_moves.empty?

    # case where king has 1 move and we can move a piece to protect it
    if king_moves.length == 1

    end

    enemy_pieces = (color == :white ? black_pieces : white_pieces)
    enemy_moves = []
    enemy_pieces.each { |enemy| enemy_moves += enemy.moves }
    king_moves.all? { |move| enemy_moves.include?(move) }
  end

  private
  attr_reader :null_piece
end