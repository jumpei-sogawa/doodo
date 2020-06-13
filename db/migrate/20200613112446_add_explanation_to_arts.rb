class AddExplanationToArts < ActiveRecord::Migration[5.2]
  def change
    add_column :arts, :explanation, :text
  end
end
