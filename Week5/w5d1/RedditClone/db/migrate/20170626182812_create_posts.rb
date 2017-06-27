class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :url, null: false
      t.integer :author_id, null: false

      t.timestamps
    end

    add_index :posts, :author_id
  end
end
