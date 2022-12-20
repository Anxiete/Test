class AddImgToCards < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :img, :string
  end
end
