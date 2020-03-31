class CreateExhibitions < ActiveRecord::Migration[5.2]
  def change
    create_table :exhibitions do |t|
      t.references :museum, foreign_key: true
      t.string :name
      t.date :start_date
      t.date :end_date
      t.text :fee
      t.string :closing_day
      t.string :opening_hours
      t.string :phone
      t.string :organizer
      t.string :website
      t.string :image
      t.float  :star

      t.timestamps
    end
  end
end
