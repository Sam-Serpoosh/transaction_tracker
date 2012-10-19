require "spec_helper"

describe Transaction do
  let(:attr) do
    {
      :name => "shopping",
      :store => "7-Eleven",
      :category => "grocery",
      :price => 10
    }
  end

  context "#initialization" do
    it "sets the name" do
      tr = Transaction.new(attr)
      tr.name.should == attr.fetch(:name) 
    end

    it "sets store" do
      tr = Transaction.new(attr)
      tr.store.should == attr.fetch(:store) 
    end

    it "sets category" do
      tr = Transaction.new(attr)
      tr.category.should == attr.fetch(:category) 
    end

    it "sets price" do
      tr = Transaction.new(attr)
      tr.price.should == attr.fetch(:price)
    end

    it "sets day automatically" do
      tr = Transaction.new(attr)
      tr.day.should == Date.today
    end
  end

  context "#validations" do
    it "is not valid without a name" do
      tr = Transaction.new(attr.merge(:name => ""))
      tr.should_not be_valid
    end

    it "is not valid without a category" do
      tr = Transaction.new(attr.merge(:category => ""))
      tr.should_not be_valid
    end

    it "is not valid withouth a price" do
      tr = Transaction.new(attr.merge(:price => ""))
      tr.should_not be_valid
    end

    it "is valid with name, price and category" do
      tr = Transaction.new(attr)
      tr.should be_valid
    end
  end

  context "#to_s" do
    it "is a combination of name and category" do
      name, category = "shopping", "grocery"
      tr = Transaction.new(attr.merge(:name => name, 
                                      :category => category))
      tr.to_s.should == "#{name}-#{category}"
    end
  end

  context "#categorization" do
    it "categorize the transactions" do
      3.times do
        tr = Transaction.new(attr)
        tr.save
      end
      2.times do
        tr = Transaction.new(attr.merge(:category => "food"))
        tr.save
      end
      categorized = Transaction.categorize
      categorized["food"].count.should == 2
      categorized["grocery"].count.should == 3
    end
  end
end
