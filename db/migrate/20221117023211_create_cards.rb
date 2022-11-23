class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :card_type
      t.integer :power
      t.integer :shield
      t.string :nation
      t.integer :grade
      t.string :race
      t.text :flavor
      t.text :effect
      t.string :format
      t.references :card_clan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
