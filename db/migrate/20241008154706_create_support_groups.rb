class CreateSupportGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :support_groups do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
