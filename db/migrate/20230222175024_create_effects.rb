class CreateEffects < ActiveRecord::Migration[7.0]
  def change
    create_table :effects do |t|
      t.string :name
      t.string :icon
      t.float :score
      t.string :type
      t.integer :votes
      t.integer :strain_id

      t.timestamps
    end
  end
end
