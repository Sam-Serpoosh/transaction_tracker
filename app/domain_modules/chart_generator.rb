require "gruff"
require_relative "./total_payment_per_category"

class ChartGenerator
  IMAGE_PATH = File.expand_path(__FILE__ + 
    "/../../assets/images/payment_per_category.png")
  def self.draw(transactions)
    payments_per_category = TotalPaymentPerCategory.
      calculate(transactions)

    pie_chart = Gruff::Pie.new
    fill_chart_data(pie_chart, payments_per_category)
    pie_chart.write(IMAGE_PATH)
  end

  private
    def self.fill_chart_data(pie_chart, payments_per_category)
      pie_chart.title = "Payment per category"
      payments_per_category.each do |category, total_payment|
        pie_chart.data category, total_payment
      end
    end
end
