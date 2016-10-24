class CreateTwitTags < ActiveRecord::Migration
  def change
    create_table :twit_tags do |t|
      t.integer :twit_id
      t.integer :tag_id
      t.timestamps null: false
    end
  end
end
