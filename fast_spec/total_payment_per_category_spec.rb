require_relative "./spec_helper_lite"
require_relative_to_root "app/domain_modules/total_payment_per_category"

describe TotalPaymentPerCategory do
  it "calculates paymetn for one category" do
    tr = stub(:price => 10)
    categorized_transactions = { "food" => [tr] }
    payment_per_category = TotalPaymentPerCategory.
      calculate(categorized_transactions)
    payment_per_category.should == { :food => 10 }
  end

  it "calculates the total payment for each category" do
    tr1 = stub(:price => 10)
    tr2 = stub(:price => 5)
    tr3 = stub(:price => 20)
    categorized_transactions = { 
                                 "food" => [tr1, tr2],
                                 "grocery" => [tr3]
                               }
    payment_per_category = TotalPaymentPerCategory.
      calculate(categorized_transactions)
    payment_per_category.should == { 
                                     :food => 15, 
                                     :grocery => 20
                                   }
  end
end
