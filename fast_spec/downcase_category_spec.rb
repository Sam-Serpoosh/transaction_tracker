require_relative "./spec_helper_lite"
require_relative_to_root "app/domain_modules/downcase_category"

describe DowncaseCategory do
  it "downcases the category" do
    attributes = 
      { "name" => "shopping", "category" => "GroCery"}
    downcased = DowncaseCategory.downcase(attributes)
    downcased.should == 
      { "name" => "shopping", "category" => "grocery" }
  end
end
