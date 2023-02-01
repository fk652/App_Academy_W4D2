module Slideable
  HORIZONTAL_DIRS = []
  DIAGONAL_DIRS = []

  def horizontal_dirs
    HORIZONTAL_DIRS = []

    # up
    grow_unblocked_moves_in_dir(1, 0)

    # down
    grow_unblocked_moves_in_dir(-1, 0)

    # left
    grow_unblocked_moves_in_dir(0, -1)

    # right
    grow_unblocked_moves_in_dir(0, 1)

    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS = []

    # up right
    grow_unblocked_moves_in_dir(-1, 1)

    # up left
    grow_unblocked_moves_in_dir(-1, -1)

    # down left
    grow_unblocked_moves_in_dir(1, -1)

    # down right
    grow_unblocked_moves_in_dir(1, 1)

    DIAGONAL_DIRS
  end

  def blocked?(pos)
    return true if (board[pos].color == color) || pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7
    false
  end

  def enemy?(pos)
    return true if board[pos].color != color
    false
  end

  def moves
    dirs = move_dirs
    horizontal_dirs if dirs.include?(:horizontal)
    diagonal_dirs if dirs.include?(:diagonal)
    HORIZONTAL_DIRS + DIAGONAL_DIRS
  end

  private
  def move_dirs

  end

  def grow_unblocked_moves_in_dir(dx, dy)
    direction_array = (dx != 0 && dy != 0 ? DIAGONAL_DIRS : HORIZONTAL_DIRS)
    considered_pos = [*pos] # make a copy of pos
    considered_pos[0] += dx
    considered_pos[1] += dy
    found_enemy = false
    until blocked?(considered_pos) || found_enemy
      found_enemy = enemy?(pos)
      direction_array << considered_pos
      considered_pos[0] += dx
      considered_pos[1] += dy
    end
  end
end

module Stepable
  def moves

  end

  private
  def move_diffs

  end
end