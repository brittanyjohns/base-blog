class CreateTerps < ActiveRecord::Migration[7.0]
  def change
    create_table :terps do |t|
      t.string :name
      t.string :description
      t.float :score
      t.integer :strain_id

      t.timestamps
    end
  end
end
