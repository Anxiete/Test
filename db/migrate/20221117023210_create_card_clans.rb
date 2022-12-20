class CreateCardClans < ActiveRecord::Migration[7.0]
  def change
    create_table :card_clans do |t|
      t.string :name

      t.timestamps
    end
  end
end
