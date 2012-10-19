require_relative "./convert_keys_to_symbol"

class TotalPaymentPerCategory
  def self.calculate(categorized_transactions)
    symbolized_transactions = ConvertKeysToSymbol.
      convert(categorized_transactions)

    payment_per_category = {}
    symbolized_transactions.keys.each do |key|
      payment_per_category[key] = 
        total_payment_for_category(symbolized_transactions, key)
    end
    payment_per_category
  end

  def self.total_payment_for_category(transactions, key)
      trs = transactions[key]
      payment = 0
      trs.each do |tr|
        payment += tr.price
      end
      payment
  end
end
