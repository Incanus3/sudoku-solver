require_relative 'grid'

module Sudoku
  class Puzzle
    def initialize(grid_or_matrix)
      if grid_or_matrix.is_a?(Grid)
        @grid = grid_or_matrix
      else
        @grid = Grid.new(grid_or_matrix)
      end
    end

    def solve
      updated_grid = @grid
      solved       = false
      round        = 0

      until solved
        round += 1

        puts "=" * 80
        puts "round #{round}"

        possible_changes = updated_grid.analyze

        if possible_changes.empty?
          solved = true
        else
          updated_grid = updated_grid.apply_changes(possible_changes)
          puts "new grid:"
          pp updated_grid
        end
      end

      self.class.new(updated_grid)
    end
  end
end
