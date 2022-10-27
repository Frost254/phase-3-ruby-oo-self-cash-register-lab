class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction
    
    def initialize(discount = nil, total = 0, items = [])
        @discount = discount
        @total = total
        @items = items
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        self.last_transaction = price * quantity
        quantity.times { @items << title }
    end
    
    def apply_discount
        if @discount
            new_discount = @discount / 100.0
            self.total = self.total - (self.total * new_discount).to_i
            "After the discount, the total comes to $#{self.total}."
        else 
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        void_item = @items.pop(1)
        self.total -= self.last_transaction

        if !@items.length
            @total = 0.0
        end
    end
end
