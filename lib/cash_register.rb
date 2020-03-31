class CashRegister
  
  attr_accessor :total, :discount, :items, :item_hash
  
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @item_hash = {}
  end
  
  def add_item(name, price, quantity=1)
    @total += price * quantity
    quantity.times do
      @items.push(name)
    end
    @item_hash[name] = {:price => price, :quantity => quantity}
  end
  
  def apply_discount
    if @discount > 0
      @total -= total * (discount / 100.0)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end
  
  def items
    @items
  end
  
  def void_last_transaction
    @total -= (@item_hash[@items[-1]][:price] * @item_hash[@items[-1]][:quantity])
    @items.pop()
  end
  
end