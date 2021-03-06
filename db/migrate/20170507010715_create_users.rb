class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.timestamps null: false
    end
    add_foreign_key :likes, :users
    add_foreign_key :statuses, :users
  end
end
