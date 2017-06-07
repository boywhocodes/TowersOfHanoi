require "rspec"
require "tdd"

describe "my_uniq" do
  it "removes duplicates from array" do
    expect(my_uniq([1,2,1,3,3])).to eq([1,2,3])
  end

  it "returns an empty arrray when given an empty array" do
    expect(my_uniq([])).to eq([])
  end

end

describe "two_sum" do
  it "includes all indicies that sum to zero in an array" do
    expect(two_sum([-1, 0, 2, -2, 1])).to eq([[0, 4], [2, 3]])
  end

  it "all indices are sorted from least to greatest" do
    expect(two_sum([-1, 0, 2, -2, 1])).not_to eql([[2, 3], [0, 4]])
  end

  it "excludes double counting zeros" do
    expect(two_sum([-1, 0, 2, -2, 1])).not_to include([1,1])
  end

  it "returns an empty arrray when given an empty array" do
    expect(two_sum([])).to eq([])
  end
end

describe "my_transpose" do
  it "converts the row-orientations into column-transfixtures" do
    expect(my_transpose([
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ])).to eq([
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ])
  end

  it "raises an error if all rows are not the same length" do
    rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7]
  ]
    expect {my_transpose(rows)}.to raise_error(IndexError)
  end

  it "output should return same length as input" do
    cols = my_transpose([
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ])
    expect(cols.all? { |col| col.length == 3}).to be true
  end

  it "returns an empty arrray when given an empty array" do
    expect(my_transpose([])).to eq([])
  end
end

describe "stock_picker" do
  it "return the indidces that represent the highest profit" do
    expect(stock_picker([400, 100, 200, 350, 80, 300])).to eq([1,3])
  end

  it "cannot sell a stock before you buy one" do
    index = stock_picker([400, 100, 200, 350, 50, 300])
    expect(index[0] < index[1]).to be true
  end

  it "returns an empty array if the market is dead" do
    expect(stock_picker([])).to eq([])
  end

  it "returns an empty an array if there is no positive profit" do
    expect(stock_picker([400, 100, 100])).to eq([])
  end
end
