require 'spec_helper'

describe "transactions/index.html.erb" do
  let(:transaction1) do
    mock_model("Transaction", :to_s => "first")
  end

  let(:transaction2) do
    mock_model("Transaction", :to_s => "second")
  end

  context "#list of existing transactions" do
    it "lists transactions as links" do
      assign :transactions, [transaction1, transaction2]
      render
      rendered.should have_selector("a", :content => "first")
      rendered.should have_selector("a", :content => "second")
    end
  end
end
