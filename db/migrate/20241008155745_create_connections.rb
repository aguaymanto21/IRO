class CreateConnections < ActiveRecord::Migration[7.1]
  def change
    create_table :connections do |t|
      t.references :user, null: false, foreign_key: true
      t.references :support_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
