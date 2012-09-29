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
end
