module Slideable
  HORIZONTAL_DIRS = []
  DIAGONAL_DIRS = []

  def horizontal_dirs
    HORIZONTAL_DIRS = []

    # up
    considered_pos = @pos
    considered_pos[0] += 1
    found_enemy = false
    until blocked?(considered_pos) || found_enemy
      found_enemy = enemy?(pos)
      HORIZONTAL_DIRS << considered_pos
      considered_pos[0] += 1
    end

    # down
    considered_pos = @pos
    considered_pos[0] -= 1
    found_enemy = false
    until blocked?(considered_pos) || found_enemy
      found_enemy = enemy?(pos)
      HORIZONTAL_DIRS << considered_pos
      considered_pos[0] -= 1
    end

    # left
    considered_pos = @pos
    considered_pos[1] -= 1
    found_enemy = false
    until blocked?(considered_pos) || found_enemy
      found_enemy = enemy?(pos)
      HORIZONTAL_DIRS << considered_pos
      considered_pos[1] -= 1
    end

    # right
    considered_pos = @pos
    considered_pos[1] += 1
    found_enemy = false
    until blocked?(considered_pos) || found_enemy
      found_enemy = enemy?(pos)
      HORIZONTAL_DIRS << considered_pos
      considered_pos[1] += 1
    end

    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS = []
    # up right
    considered_pos = @pos
    considered_pos[0] -= 1
    considered_pos[1] += 1
    found_enemy = false
    until blocked?(considered_pos) || found_enemy
      found_enemy = enemy?(pos)
      DIAGONAL_DIRS << considered_pos
      considered_pos[0] -= 1
      considered_pos[1] += 1
    end

    # up left
    considered_pos = @pos
    considered_pos[0] -= 1
    considered_pos[1] -= 1
    found_enemy = false
    until blocked?(considered_pos) || found_enemy
      found_enemy = enemy?(pos)
      DIAGONAL_DIRS << considered_pos
      considered_pos[0] -= 1
      considered_pos[1] -= 1
    end

    # down left
    considered_pos = @pos
    considered_pos[0] += 1
    considered_pos[1] -= 1
    found_enemy = false
    until blocked?(considered_pos) || found_enemy
      found_enemy = enemy?(pos)
      DIAGONAL_DIRS << considered_pos
      considered_pos[0] += 1
      considered_pos[1] -= 1
    end

    # down right
    considered_pos = @pos
    considered_pos[0] += 1
    considered_pos[1] += 1
    found_enemy = false
    until blocked?(considered_pos) || found_enemy
      found_enemy = enemy?(pos)
      DIAGONAL_DIRS << considered_pos
      considered_pos[0] += 1
      considered_pos[1] += 1
    end

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

  end
end

module Stepable
  def moves

  end

  private
  def move_diffs

  end
end