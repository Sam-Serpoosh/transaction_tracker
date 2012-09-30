class TransactionsController < ApplicationController
  def index; end
    
  def show
    @transaction = Transaction.find(params[:id])
  end

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
end
