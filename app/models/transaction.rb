class Transaction < ActiveRecord::Base
  attr_accessible :name, :store, :category, :price

  validates :name, :presence => true
  validates :category, :presence => true
  validates :price, :presence => true

  def initialize(attr={})
    super(attr)
    self.day = Date.today
  end

  def self.categorize
    categorized = all.group_by { |tr| tr.category }
  end

  def to_s
    "#{self.name}-#{self.category}"
  end
end

#      Transaction.all(:group => "category").collect do |c| 
#      [c.category, Transaction.sum("price", :conditions => "category='#{c.category}'")]
