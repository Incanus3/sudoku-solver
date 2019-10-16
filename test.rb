require_relative 'lib/sudoku'

test_matrix = [
  [4,   9,   6,   5,   7,   nil, nil, nil, 2  ],
  [2,   1,   8,   nil, 6,   3,   7,   4,   nil],
  [7,   5,   nil, nil, nil, nil, nil, 9,   nil],
  [5,   nil, 1,   nil, 2,   6,   nil, nil, nil],
  [6,   nil, nil, 3,   nil, 8,   nil, 5,   nil],
  [nil, 2,   nil, 4,   nil, nil, 6,   1,   3  ],
  [9,   nil, nil, nil, nil, 4,   3,   nil, nil],
  [nil, nil, 5,   nil, nil, 7,   4,   nil, nil],
  [3,   nil, nil, 2,   nil, nil, nil, 6,   nil]
]

puzzle        = Sudoku::Puzzle.new(test_matrix)
solved_puzzle = puzzle.solve

pp solved_puzzle
