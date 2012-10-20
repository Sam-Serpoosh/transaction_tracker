class DowncaseCategory
  CATEGORY = "category"
  def self.downcase(attributes)
    return attributes if !attributes.keys.include?(CATEGORY)
    category = attributes.fetch(CATEGORY)
    attributes.merge!(CATEGORY => category.downcase) if !category.nil?
  end
end
