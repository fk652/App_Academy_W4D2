require_relative 'chess_modules'
require "singleton"

class Piece
  attr_reader :color, :board
  attr_accessor :pos

  def initialize(color, board, pos)
    
    @color = color
    @board = board 
    @pos = pos 

  end

  def to_s

  end

  def empty?

  end
  
  def valid_moves

  end

  def pos=(val)

  end

  def symbol

  end

  private
  def move_into_check?(end_pos)

  end
end


class Rook < Piece
  include Slideable

  def initialize(color, board, pos)
    super
  end

  def symbol

  end

  private
  def move_dirs
    [:horizontal]
  end
end

class Bishop < Piece
  include Slideable
  def initialize(color, board, pos)
    super
  end

  def symbol
    
  end

  private
  def move_dirs
    [:diagonal]
  end
end

class Queen < Piece
  include Slideable
  def initialize(color, board, pos)
    super
  end

  def symbol
    
  end

  private
  def move_dirs
    [:horizontal, :diagonal]
  end
end


class King < Piece
  include Stepable
  def initialize(color, board, pos)
    super
  end

  def symbol
    
  end

  protected
  def move_diffs 
    [
      [1, 0],   # up
      [-1, 0],  # down
      [0, -1],  # left
      [0, 1],   # right
      [-1, 1],  # up right
      [-1, -1], # up left
      [1, -1],  # down left
      [1, 1]    # down right
    ]

  end
end


class Knight < Piece
  include Stepable
  def initialize(color, board, pos)
    super
  end

  def symbol
    
  end

  protected
  def move_diffs
    [
      [-2, -1],   # slide up left
      [-1, -2],   # slide left up
      [1, -2],    # slide left down
      [2, -1],    # slide down left
      [2,  1],    # slide right down
      [1,  2],    # slide down right
      [-1, 2],    # slide right up
      [-2, 1]     # slide up right
    ]
  end
end


class Pawn < Piece
  def initialize(color, board, pos)
    super
  end

  def symbol
    
  end

  def moves

  end

  private
  def at_start_row?

  end

  def forward_dir

  end

  def forward_steps

  end

  def side_attacks

  end
end


class NullPiece < Piece
  include Singleton
  attr_reader :color, :symbol
  
  def initialize
    @color = :pink
    @symbol = :nil  #'⭐️' #🧱
  end

  def moves

  end

  def symbol
    
  end

  private
end

# puts '🧱'
