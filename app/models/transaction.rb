class Transaction < ActiveRecord::Base
  attr_accessible :name, :store, :category, :price

  def initialize(attr)
    super(attr)
    self.day = Date.today
  end
end
