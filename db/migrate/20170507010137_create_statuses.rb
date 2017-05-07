class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.timestamps null: false
    end
    add_foreign_key :likes, :statuses
  end
end
