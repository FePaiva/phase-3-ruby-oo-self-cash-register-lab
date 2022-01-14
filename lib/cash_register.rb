require 'pry'
class CashRegister

  attr_accessor :total, :discount, :price, :items, :last_transaction
  attr_reader :title
  
  def initialize(discount=0)
      @total = 0
      @discount = discount
      @items = []
  end

  def add_item(title, price, quantity=1)
    self.last_transaction = price * quantity
    @total = (price * quantity) + total
    quantity.times { @items << title}
  end

  def apply_discount
    if discount == 0 
    return "There is no discount to apply."
    else discount > 0 
      @total= @total - (@total*(discount.to_f / 100))
      return "After the discount, the total comes to $#{total.to_i}."
    end
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end
end