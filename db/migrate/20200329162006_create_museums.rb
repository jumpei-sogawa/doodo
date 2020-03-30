class CreateMuseums < ActiveRecord::Migration[5.2]
  def change
    create_table :museums do |t|
      t.references :prefecture, foreign_key: true
      t.string :name
      t.string :address
      t.string :phone
      t.string :website
      t.string :image

      t.timestamps
    end
  end
end
