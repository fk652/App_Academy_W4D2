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
    return true if pos[0] == 1 || pos[0] == 6 
    false 
  end

  def forward_dir
    color == :white ? -1 : 1

  end

  def forward_steps
    considered_moves = []
    dx = forward_dir
    
    considered_pos = pos.dup
    considered_pos[0] += dx

    if !blocked(considered_pos) 
      considered_moves << considered_pos.dup
      
      considered_pos[0] += dx
      if !blocked(considered_pos) && at_start_row?
        considered_moves << considered_pos.dup 
      end
    end
   
    return considered_moves 
  end

  def side_attacks

  end

  def blocked?(pos)
    return true if pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7 || (board[pos].color == color) 
    false
  end

  def enemy?(pos)
    return true if board[pos].color != color
    false
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
