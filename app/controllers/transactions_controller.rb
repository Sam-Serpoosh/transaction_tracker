class TransactionsController < ApplicationController
  before_filter :find_transaction, :only => [:show, :edit, 
                                             :update]

  def index
    @transactions = Transaction.all
  end
    
  def show; end

  def new
    @transaction = Transaction.new
  end

  def create
    if created?
      flash[:success] = "Created a new Transaction."
      redirect_to @transaction
    else
      flash.now[:error] = "Invalid Transaction information."
      render :action => :new
    end 
  end

  def edit; end

  def update
    if updated? 
      flash[:success] = "Transaction updated."
      redirect_to @transaction
    else
      flash.now[:error] = "Invalid information!"
      render :action => :edit
    end
  end

  def current_month_transactions
    @transactions = CurrentMonthTransactions.get_transactions
    render :action => :index
  end

  private

    def find_transaction
      @transaction = Transaction.find(params[:id])
    end

    def created?
      @transaction = Transaction.new(params[:transaction])
      @transaction.save
    end

    def updated?
      @transaction.update_attributes(params[:transaction])
    end
end
