$first_time = true

module Sudoku
  class Grid
    def initialize(matrix)
      @matrix = matrix
    end

    def analyze
      puts "in Sudoku::Grid#analyze"

      changes = []

      @matrix.each_with_index do |row, row_number|
        row.each_with_index do |cell_value, col_number|
          next if cell_value

          new_value = analyze_cell(row_number, col_number)
          changes << [row_number, col_number, new_value] if new_value
        end
      end

      if $first_time
        $first_time = false
        changes << [0, 5, 10] # test
      end

      changes
    end

    def analyze_cell(row_number, col_number)
      puts "analyzing cell at (#{row_number+1}, #{col_number+1})"
      possible_values = get_possible_values(row_number, col_number)

      return possible_values[0] if possible_values.length == 1
    end

    def get_possible_values(row_number, col_number)
      []
    end

    def apply_changes(changes)
      puts "in Grid#apply_changes"
      new_matrix = @matrix.clone

      changes.each do |(row_number, col_number, new_value)|
        new_matrix[row_number][col_number] = new_value
      end

      self.class.new(new_matrix)
    end
  end
end
