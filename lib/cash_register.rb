require 'pry'

class CashRegister

    attr_accessor :cart, :last_trans
    
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @cart = []
    end

    def discount
        @discount
    end

    def total 
        @total
    end

    def total=(amount)
        @total = amount
    end

    def add_item(item, price, qty=1)
        self.total += (price * qty)
        # @cart.push(item) * qty
        @last_trans = {
            name: item,
            cost: price,
            num: qty,
        }
        qty.times do @cart.push(item)
        end
        #binding.pry
    end

    def apply_discount
        if @discount > 0
            @total = total * (100-@discount)/100
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @cart
    end

    def void_last_transaction
        self.total -= @last_trans[:cost] * @last_trans[:num]
        self.last_trans[:num].times do 
            @cart.pop
        end
        #binding.pry
    end


end