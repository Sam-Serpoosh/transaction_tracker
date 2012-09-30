class Transaction < ActiveRecord::Base
  attr_accessible :name, :store, :category, :price

  validates :name, :presence => true
  validates :category, :presence => true
  validates :price, :presence => true

  def initialize(attr={})
    super(attr)
    self.day = Date.today
  end
end
