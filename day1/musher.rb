class Musher
  def initialize symbol
    @symbol = symbol
  end
  def mush array
    puts "#{array[0]} #{@symbol} #{array[1]} #{@symbol} #{array[2]} "
  end
end

Musher.new("+").mush(["array","of","strings"])
