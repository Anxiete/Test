class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.decimal :price
      t.integer :quantity
      t.decimal :GST
      t.decimal :PST
      t.decimal :HST
      t.decimal :total
      t.string :address
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
