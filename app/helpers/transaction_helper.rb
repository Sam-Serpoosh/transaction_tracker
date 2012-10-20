module TransactionHelper
  def draw_payment_per_category_chart(transactions)
    ChartGenerator.draw(transactions)
    image_tag("payment_per_category.png", :size => "400x400", :alt => "Payment Per Category", :class => "round")
  end
end
