class Checkout

    def initialize(promotional_rules)
        @promotional_rules = promotional_rules
    end

    def scan(item)
        @item = item
    end

    def total
        total = 0
    
        if !@item
          return total
        end
            
        @item.split(",").inject(total) do |subtotal, item|
            subtotal += {"001" => 9.25, "002" => 45, "003" => 19.95}[item]
          
        end
    end

    def apply_discount(sum, discount)
        sum - ( discount.to_f / 100 * sum )
    end

end