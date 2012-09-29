class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :name
      t.string :store
      t.string :category
      t.date :day
      t.integer :price

      t.timestamps
    end
  end
end
