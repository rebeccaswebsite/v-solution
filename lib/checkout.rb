class Checkout

    def scan(item)
        @item = item
    end

    def total
        total = 0
    
        if !@item
          return total
        end
    end
    
end