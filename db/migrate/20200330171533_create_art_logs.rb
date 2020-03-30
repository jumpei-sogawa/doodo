class CreateArtLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :art_logs do |t|
      t.references :user, foreign_key: true
      t.references :exhb_log, foreign_key: true
      t.references :art, foreign_key: true
      t.integer :star
      t.text :body
      t.string :image

      t.timestamps
    end
  end
end
