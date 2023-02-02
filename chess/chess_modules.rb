module Slideable
  HORIZONTAL_DIRS = [
    [1, 0],   # up
    [-1, 0],  # down
    [0, -1],  # left
    [0, 1]    # right
  ]
  DIAGONAL_DIRS = [
    [-1, 1],  # up right
    [-1, -1], # up left
    [1, -1],  # down left
    [1, 1]    # down right
  ]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    # returns all moves in an array
    all_moves = []
    dirs = move_dirs

    if dirs.include?(:horizontal)
      horizontal_dirs.each do |dx, dy|
        all_moves += grow_unblocked_moves_in_dir(dx, dy)
      end
    end

    if dirs.include?(:diagonal)
      diagonal_dirs.each do |dx, dy|
        all_moves += grow_unblocked_moves_in_dir(dx, dy)
      end
    end

    all_moves
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    moves = []
    considered_pos = pos.dup # make a copy of current position
    considered_pos[0] += dx
    considered_pos[1] += dy
    found_enemy = false
    until blocked?(considered_pos) || found_enemy
      found_enemy = enemy?(pos)
      moves << considered_pos.dup
      considered_pos[0] += dx
      considered_pos[1] += dy
    end
    moves
  end

  private
  def move_dirs
    # gets all moves directions
    # implemented in subclasses
  end
end

module Stepable
  def moves
    all_moves = []
    move_diffs.each do |dx, dy|
      considered_pos = pos.dup # make a copy of current position
      considered_pos[0] += dx
      considered_pos[1] += dy
      all_moves << considered_pos.dup if !blocked?(considered_pos)
    end
    all_moves
  end

  private
  def move_diffs
    # implemented in subclass
    # gets all possible move directions
  end
end