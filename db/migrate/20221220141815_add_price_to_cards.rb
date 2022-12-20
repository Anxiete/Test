class AddPriceToCards < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :price, :decimal
  end
end
