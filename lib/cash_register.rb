require 'pry'
class CashRegister
    attr_reader :discount#, :items
    attr_accessor :total

    def initialize(discount = nil)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.total += (price * quantity)
        quantity.times do @items << {title => [price,quantity]} end
        # binding.pry
    end

    def apply_discount
        message = ""
        # binding.pry
        if self.discount != nil
            self.total *= (100-self.discount)/100.0
            message = "After the discount, the total comes to $#{self.total.to_i}."
        else
            message = "There is no discount to apply."
        end
        message
    end

    def items
        item_names = []
        @items.each {|item| item_names << item.keys[0]}
        item_names
    end

    def void_last_transaction()
        item = @items.pop()
        self.total -= item[item.keys[0]][0]*item[item.keys[0]][1]
        #binding.pry
    end

end
