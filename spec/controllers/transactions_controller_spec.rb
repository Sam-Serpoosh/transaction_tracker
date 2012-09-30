require "spec_helper"

describe TransactionsController do
  describe "showing" do
    it "fetches the appropriate transaction" do
      transaction = stub
      Transaction.stub(:find => transaction)
      get :show, :id => 1
      assigns(:transaction).should == transaction
    end
  end

  describe "newing" do
    it "sets a brand new transaction" do
      get :new
      assigns(:transaction).should_not be_nil
    end
  end

  describe "creating" do
    context "#invalid transaction" do
      it "does not create it" do
        lambda do
          post :create, :transaction => {}
          response.should render_template("new")
        end.should_not change(Transaction, :count)
      end
    end

    context "#valid transaction" do
      it "creates it" do
        attributes = { :name => "shopping", :category => "grocery", :price => 10 }
        lambda do
          post :create, :transaction => attributes
          response.should redirect_to(assigns(:transaction))
        end.should change(Transaction, :count).by 1
      end
    end
  end
end
