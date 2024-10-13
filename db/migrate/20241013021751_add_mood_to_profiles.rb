class AddMoodToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :mood, :string
  end
end
