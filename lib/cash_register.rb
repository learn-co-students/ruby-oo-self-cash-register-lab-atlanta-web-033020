
require 'pry'

class CashRegister

    attr_accessor :total, :discount
    attr_reader :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        # Changed both to floats but it broke the tests
        @items = []
        @price = []
        @quantity = []
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        quantity.times do
            @items << title
            @price << price
            @quantity << quantity
        end 

        #@quantity << quantity

        # @items << title * quantity
    end

    def apply_discount
        # OO Building: OO Design: total = total - total * 20 / 100.00
        # change object type Integer to Float (& vice versa) 
        if @discount == 0
            "There is no discount to apply."
        else
        # binding.pry
        self.total = total - total * discount / 100.0
        "After the discount, the total comes to $#{total.to_i}."
        # self.total = total - total * discount / 100.0
        # @total = @total - @total * 20 / 100
        # self.total = @total - @total * 20 / 100.00
        # @total = @total - @total * 20 / 100.00
        end
    end

    def void_last_transaction
       
        var = @quantity[-1]
        #quantity.pop.times do
        var.times do
            @items.pop
            @quantity.pop
            @total -= @price.pop        
        end       
    end
    


end







