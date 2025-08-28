# frozen_string_literal: true

KNIGHT_MOVES = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]].freeze

def valid_square?(sqr)
  sqr[0].between?(0, 7) && sqr[1].between?(0, 7)
end

def knight_moves_from(sqr)
  moves = KNIGHT_MOVES.map { |move| [sqr[0] + move[0], sqr[1] + move[1]] }
  moves.select { |move| valid_square?(move) }
end

def shortest_knight_path(start, dest)
  queue = [[start]]
  visited = [start]

  until queue.empty?
    path = queue.shift
    return path if path.last == dest

    (knight_moves_from(path.last) - visited).each do |move|
      visited << move
      queue << (path + [move])
    end
  end
end

def knight_moves(start, dest)
  raise IndexError unless valid_square?(start) && valid_square?(dest)

  path = shortest_knight_path(start, dest)
  puts "You made it in #{path.length} moves! Here's your path:"
  path.each { |move| puts move.inspect }
end

knight_moves([0, 0], [7, 7])
