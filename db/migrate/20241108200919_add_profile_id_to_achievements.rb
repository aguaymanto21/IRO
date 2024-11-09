class AddProfileIdToAchievements < ActiveRecord::Migration[7.1]
  def change
    add_reference :achievements, :profile, null: false, foreign_key: true
  end
end
