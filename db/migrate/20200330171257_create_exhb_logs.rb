class CreateExhbLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :exhb_logs do |t|
      t.references :user, foreign_key: true
      t.references :exhibition, foreign_key: true
      t.float :star
      t.text :body

      t.timestamps
    end
  end
end
