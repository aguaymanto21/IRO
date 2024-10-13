class ChangeMoodToArrayInProfiles < ActiveRecord::Migration[7.1]
  def change
    remove_column :profiles, :mood, :string
    add_column :profiles, :mood, :string, array: true, default: []
  end
end
