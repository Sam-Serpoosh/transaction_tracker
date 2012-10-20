module ApplicationHelper
  def logo
    image_tag("tracker_logo.png", :size => "350x100", :alt => "Transaction Tracker", :class => "round")
  end
end
