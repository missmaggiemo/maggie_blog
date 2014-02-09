class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.integer :user_id
      t.string :category
      t.string :author
      t.string :title
      t.text :content
      t.string :image, default: "default.png"

      t.timestamps
    end
    add_index :blog_posts, [:user_id, :created_at]
  end
end
