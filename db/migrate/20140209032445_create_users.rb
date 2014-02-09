class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.boolean :admin, default: false
      t.string :password_digest
      t.string :remember_token
      t.string :image, default: "default.png"

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
