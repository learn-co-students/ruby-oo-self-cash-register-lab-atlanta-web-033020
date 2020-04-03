class CashRegister

    attr_accessor :total, :items
    attr_reader :discount
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        
    end
    
    

    def add_item(title, price, quantity = 1)
        self.total += price * quantity

        
        quantity.times {@items << {title => [price, quantity]}}
        
    end
    def items
        itemized_list = []
        @items.each {|item| itemized_list << item.keys[0]}
        itemized_list
    end
    def apply_discount
        if self.discount != 0
        new_total = self.total -= (self.total * discount/100)
        "After the discount, the total comes to $#{new_total}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        voided_item = @items.pop()
        self.total -= voided_item[voided_item.keys[0]][0] *voided_item[voided_item.keys[0]][1]

    end



end
