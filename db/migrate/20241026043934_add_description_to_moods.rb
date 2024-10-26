class AddDescriptionToMoods < ActiveRecord::Migration[7.1]
  def change
    add_column :moods, :description, :string
  end
end
