require_relative "./spec_helper_lite"
require_relative_to_root "app/domain_modules/current_month_transactions"

class Transaction; end

describe CurrentMonthTransactions do
  let(:october) { 10 }
  let(:calendar) { stub(:today => Date.new(2012, october, 10)) }
  let(:tr1) { stub(:day => Date.new(2012, 9, 1)) }
  let(:tr2) { stub }

  subject do
    @transactions = CurrentMonthTransactions.
      get_transactions(calendar)
  end

  before do
    Transaction.stub(:all => [tr1, tr2])
  end

  it "transactions of current month and in same year" do
    tr2.stub(:day => Date.new(2012, october, 1))
    subject
    @transactions.should == [tr2]
  end

  it "transactions of current month but in different years" do
    tr2.stub(:day => Date.new(2011, october, 1))
    subject
    @transactions.should == []
  end
end
