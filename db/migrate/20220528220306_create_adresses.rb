class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.string :post_code, null: false
      t.integer :area_id, null: false
      t.string :municipality, null: false
      t.string :adress, null: false
      t.string :building
      t.integer :phone, null: false
      t.references :purchase, null: false, foreign_key: true
      t.timestamps
    end
  end
end
