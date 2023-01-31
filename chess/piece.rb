require_relative 'chess_modules'

class Piece

  def initialize(color, board, pos)
    
    @color = symbol
    @board = Board 
    @pos = pos 

  end

  def moves

  end



end


class Rook < Piece
  include Slideable
end


class Queen < Piece
  include Slideable
end


class Bishop < Piece
  include Slideable
end


class King < Piece
  include Stepable
end


class Knight < Piece
  include Stepable
end


class Pawn < Piece

end


class NullPiece < Piece
  include Singleton
end


