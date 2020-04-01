class CreateExhbLogLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :exhb_log_likes do |t|
      t.references :user, foreign_key: true
      t.references :exhb_log, foreign_key: true

      t.timestamps
    end
  end
end
