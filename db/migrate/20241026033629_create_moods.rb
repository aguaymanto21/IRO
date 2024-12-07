class CreateMoods < ActiveRecord::Migration[7.1]
  def change
    create_table :moods do |t|
      t.string :mood
      t.datetime :date
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
