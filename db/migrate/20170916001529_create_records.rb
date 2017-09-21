class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.integer :user_id
      t.string :genre
      t.string :artist
      t.string :album
      t.string :year
      t.integer :quantity

      t.timestamps
    end
  end
end
