class CashRegister
    attr_accessor :total, :discount, :items
    
    def initialize(discount = nil, total = 0, items = [])
        @discount = discount
        @total = total
        @items = items
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        quantity.times { @items << title }
    end
    
    def apply_discount
        if @discount
            new_discount = @discount / 100.0
            @total = @total - (@total * new_discount).to_i
            "After the discount, the total comes to $#{@total}."
        else 
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @items.pop(1)
        @total = @total 
    end
end
