require "spec_helper"

describe TransactionsController do
  render_views # get rid of this and move to view tests!

  describe "listing" do
    it "fetches all the transactions" do
      all_transactions = [stub, stub]
      Transaction.stub(:all => all_transactions)
      get :index
      assigns(:transactions).should == all_transactions
    end

    it "list the transactions links" do
      all_transactions = [
                          stub(:to_s => "shopping-grocery"),
                          stub(:to_s => "hair cut-style")
                         ]
      Transaction.stub(:all => all_transactions)
      get :index
      response.should have_selector("a", :content => "shopping-grocery")
    end
  end
   
  describe "showing" do
    it "fetches the appropriate transaction" do
      transaction = stub.as_null_object
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

  describe "editing" do
    it "finds the appropriate transaction for editing" do
      Transaction.stub(:find).with("1") { stub }
      get :edit, :id => 1
      assigns(:transaction).should_not be_nil
    end
  end

  describe "updating" do
    let(:attr) do 
      {
        :name => "shopping",
        :category => "grocery",
        :store => "7-Eleven",
        :price => 10
      }
    end

    before do
      @transaction = Transaction.new(attr)
      @transaction.save!
    end

    context "#valid updating" do
      it "updates and redirects to the transaction show page" do
        new_name = "updated shopping"
        put :update, :id => @transaction.id, :transaction => attr.merge(:name => new_name)
        @transaction.reload
        @transaction.name.should == new_name 
        flash[:success].should =~ /updated/i
        response.should redirect_to(@transaction)
      end

      context "#invalid updating" do
        it "doesn't update the transaction" do
          put :update, :id => @transaction.id, :transaction => attr.merge(:name => "")
          flash.now[:error].should =~ /invalid/i
          response.should render_template("edit")
        end
      end
    end
  end
end
