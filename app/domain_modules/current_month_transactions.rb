class CurrentMonthTransactions
  def self.get_transactions(calendar=Date)
    Transaction.all.select do |tr|
      today = calendar.today
      tr_date = tr.day
      tr_date.year == today.year && 
        tr_date.month == today.month
    end
  end
end
