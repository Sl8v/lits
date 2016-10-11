class CreateTwits < ActiveRecord::Migration
  def change
    create_table :twits do |t|
      t.integer :user_id
      t.text :content

      t.timestamps null: false
      add_foreign_key :twits, :users
    end
  end
end
