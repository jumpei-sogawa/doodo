class CreateExhbLogComments < ActiveRecord::Migration[5.2]
  def change
    create_table :exhb_log_comments do |t|
      t.references :user, foreign_key: true
      t.references :exhb_log, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
