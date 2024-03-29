require_relative 'spec_helper'
require_relative '../lib/checkout.rb'

promotional_rules = { "total_eligible_for_discount" => 60,
                      "discount" => 10,
                      "miminum_quantity" => 2,
                      "price_drop" => 8.5
                    }

RSpec.describe Checkout do
    context "when the item is not scanned" do
      it "returns the total price 0" do
        checkout = Checkout.new(promotional_rules)
        expect(checkout.total).to eq 0
      end
    end
  
    context "when 001 is scanned" do
      it "returns the total price 9.25" do
        checkout = Checkout.new(promotional_rules)

        checkout.scan("001")

        expect(checkout.total).to eq 9.25
      end
    end
  
    context "when 002 is scanned" do
      it "returns the total price 45" do
        checkout = Checkout.new(promotional_rules)

        checkout.scan("002")

        expect(checkout.total).to eq 45
      end
    end
  
    context "when 003 is scanned" do
      it "returns the total price 19.95" do
        checkout = Checkout.new(promotional_rules)
  
        checkout.scan("003")
  
        expect(checkout.total).to eq 19.95
      end
    end

    context "when 001,002,003 is scanned" do
        it "returns the total price 66.78" do
          checkout = Checkout.new(promotional_rules)
    
          checkout.scan("001,002,003")
    
          expect(checkout.total).to eq 66.78
        end
    end

    context "when 001,003,001 is scanned" do
        it "returns the total price 36.95" do
          checkout = Checkout.new(promotional_rules)
    
          checkout.scan("001,003,001")
    
          expect(checkout.total).to eq 36.95
        end
    end

    context "when 001,002,001,003 is scanned" do
        it "returns the total price 73.76" do
          checkout = Checkout.new(promotional_rules) 
    
          checkout.scan("001,002,001,003")
    
          expect(checkout.total).to eq 73.76
        end
    end

end