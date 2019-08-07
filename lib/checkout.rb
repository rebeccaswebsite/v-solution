class Checkout

    def initialize(promotional_rules)
        @promotional_rules = promotional_rules
    end

    def scan(item)
        @item = item
    end

    def total
        total = 0
        running_total = 0 
    
        if !@item
          return total
        end
            
        @item.split(",").inject(total) do |subtotal, item|
            subtotal += {"001" => 9.25, "002" => 45, "003" => 19.95}[item]
            running_total = subtotal
        end

        if running_total >= @promotional_rules["total_eligible_for_discount"]
            discount = @promotional_rules["discount"]
            return running_total - ( discount.to_f / 100 * running_total )
        else 
            return running_total
        end
    end

end
