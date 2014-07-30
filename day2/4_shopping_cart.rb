#4
class Shopping_Cart
  def initialize
    @my_cart = Hash.new
  end

  def add(name, price)
    @my_cart[name] = price
  end

  def remove(name)
    @my_cart.delete(name)
  end

  def checkout
    price = 0
    puts "Here is your cart: "
    @my_cart.each do |key, value|
      price += value
      puts "#{key}     $#{value}"
    end
    price = price * 1.07     # 7% tax
    price = price * 0.9 if price > 100.00 #overrides for discount
    puts "Your total is $#{price.round(2)}. Thank you for shopping with us!"
  end
end

a = Shopping_Cart.new
a.add(:first_item, 59.99)
a.add(:second_item, 65.30)
a.checkout
a.remove(:first_item)
a.checkout
