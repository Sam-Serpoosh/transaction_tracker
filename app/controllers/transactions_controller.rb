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
    @transaction = Transaction.new(params[:transaction])
    if @transaction.save
      flash[:success] = "Created a new Transaction."
      redirect_to @transaction
    else
      flash.now[:error] = "Invalid Transaction information."
      render :action => :new
    end 
  end

  def edit; end

  def update
    if @transaction.update_attributes(params[:transaction])
      flash[:success] = "Transaction updated."
      redirect_to @transaction
    else
      flash.now[:error] = "Invalid information!"
      render :action => :edit
    end
  end

  private

    def find_transaction
      @transaction = Transaction.find(params[:id])
    end
end
