require 'enumerator'

module TriangleSum
  class Triangle
    def calculate
      file = File.expand_path(File.dirname(__FILE__)) + "/../../data/triangle.txt"
      rows = IO.readlines(file).collect { |l| l.split(' ').collect { |s| s.to_i } }

      while rows.length > 1
        row, next_row = rows.pop, rows.pop
        tuple_row, new_row = Array.new, Array.new

        row.each_cons(2) { |a, b| tuple_row << [a, b] }
        (next_row.zip tuple_row).each { |node| new_row << node[0] + node[1].max }

        rows.push new_row
      end

      puts rows
    end
  end
end

