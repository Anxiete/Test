class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :type
      t.integer :power
      t.integer :shield
      t.string :nation
      t.integer :grade
      t.string :race
      t.text :flavor
      t.text :effect
      t.string :format

      t.timestamps
    end
  end
end
