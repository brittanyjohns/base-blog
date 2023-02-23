class CreateStrains < ActiveRecord::Migration[7.0]
  def change
    create_table :strains do |t|
      t.integer :original_id
      t.float :average_rating
      t.string :category
      t.string :flower_svg
      t.string :name
      t.string :nug_image
      t.string :phenotype
      t.integer :review_count
      t.string :short_description
      t.string :slug
      t.string :top_terp
      t.string :subtitle
      t.float :thc
      t.string :top_effect
      t.float :distance

      t.timestamps
    end
  end
end
