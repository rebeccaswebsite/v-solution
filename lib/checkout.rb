class Checkout

    def initialize(promotional_rules)
        @promotional_rules = promotional_rules
    end

    def scan(item)
        @item = item
        @prices = {"001" => 9.25, "002" => 45, "003" => 19.95}
    end

    def total
        total = 0
        running_total = 0 
    
        if !@item
          return total
        end
            
        @item.split(",").inject(total) do |subtotal, item|
            if duplicate_items?
                @prices["001"] = 8.5
            end
            subtotal += @prices[item]
            running_total = subtotal
        end

        if running_total >= @promotional_rules["total_eligible_for_discount"]
            discount = @promotional_rules["discount"]
            return apply_discount(running_total, discount).round(2)
        else 
            return running_total.round(2)
        end
    end

    def apply_discount(running_total, discount)
        return running_total - ( discount.to_f / 100 * running_total )
    end

    def duplicate_items?
        bag = @item.split(",")
        if bag.uniq.length == bag.length
            return false
          else
            return true
          end
          
    end

end
