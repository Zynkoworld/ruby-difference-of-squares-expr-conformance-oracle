class Squares
  attr_reader :max

  def initialize(max)
    @max = max
  end

  def square_of_sum
    sum = 0
    (1..max).each do |i|
      sum += i
    end
    sum**2
  end

  def sum_of_squares
    sum = 0
    (1..max).each do |i|
      sum += i**2
    end
    sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

require 'json'
__exprs = JSON.parse("[\"Squares.new(1).square_of_sum\", \"Squares.new(5).square_of_sum\", \"Squares.new(100).square_of_sum\", \"Squares.new(1).sum_of_squares\", \"Squares.new(5).sum_of_squares\", \"Squares.new(100).sum_of_squares\", \"Squares.new(1).difference\", \"Squares.new(5).difference\", \"Squares.new(100).difference\"]")
__out = []
__exprs.each do |e|
  begin
    __out << {ok: true, v: eval(e)}
  rescue => ex
    __out << {ok: false, e: ex.class.to_s}
  end
end
puts JSON.generate({out: __out})
