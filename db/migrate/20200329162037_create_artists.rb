class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :place
      t.integer :birth_year
      t.integer :death_year
      t.string :image

      t.timestamps
    end
  end
end
