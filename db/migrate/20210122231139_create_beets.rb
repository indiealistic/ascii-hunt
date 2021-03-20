class CreateBeets < ActiveRecord::Migration[5.2]
  def change
    create_table :beets do |t|
      t.text :title
      t.text :tags
      t.text :content
      t.text :image

      t.integer :like_count
      t.integer :comment_count

      t.integer :user_id

      t.timestamps
    end
  end
end
