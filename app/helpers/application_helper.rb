module ApplicationHelper
  def logo
    image_tag("tracker.png", :alt => "Transaction Tracker", :class => "round")
  end
end
