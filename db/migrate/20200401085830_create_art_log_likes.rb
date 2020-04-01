class CreateArtLogLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :art_log_likes do |t|
      t.references :user, foreign_key: true
      t.references :art_log, foreign_key: true

      t.timestamps
    end
  end
end
