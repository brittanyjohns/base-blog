class CreateCannabinoids < ActiveRecord::Migration[7.0]
  def change
    create_table :cannabinoids do |t|
      t.string :display_name
      t.integer :order
      t.float :percentile_25
      t.float :percentile_50
      t.float :percentile_75
      t.integer :strain_id

      t.timestamps
    end
  end
end
