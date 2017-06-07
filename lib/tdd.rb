# require "byebug"

def my_uniq(arr)
  arr.reduce([]) { |no_dups, el| !no_dups.include?(el) ? no_dups << el : no_dups }
end

def two_sum(arr)
  indices = []
  arr.each_index do |i|
    arr.each_index do |j|
      next if i == j
      indices << [i, j] if arr[i] + arr[j] == 0 && !indices.include?([j, i])
    end
  end
  indices
end


def my_transpose(row_matrix)
  first_row_length = row_matrix[0].length unless row_matrix.empty?
  raise IndexError unless row_matrix.all? { |row| row.length == first_row_length }
  col_matrix = []

  idx = 0
  until idx == row_matrix.size
    column = []
    row_matrix.each do |row|
      column << row[idx]
    end
    idx += 1
    col_matrix << column
    column = []
  end
  col_matrix
end

def stock_picker(arr)
  output = []
  profit = 0
  idx1 = 0
  idx2 = 0

  arr.each_with_index do |num1, i1|
    arr[i1+1..-1].each_with_index do |num2, i2|
      if num2 - num1 > profit
        idx1 = i1
        idx2 = i2 + i1 + 1
        profit = num2 - num1 
      end
    end
  end
  if arr.empty? || profit == 0
    return []
  else
    [idx1, idx2]
  end
end
