class CreateArts < ActiveRecord::Migration[5.2]
  def change
    create_table :arts do |t|
      t.references :exhibition, foreign_key: true
      t.integer :number
      t.references :artist, foreign_key: true
      t.string :name
      t.integer :year
      t.string :image

      t.timestamps
    end
  end
end
