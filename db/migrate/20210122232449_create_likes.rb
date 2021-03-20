class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.text :foo
      t.boolean :status
      t.integer :beet_id
      t.integer :user_id

      t.timestamps
    end
  end
end
