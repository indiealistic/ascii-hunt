class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :email
      t.text :username
      t.text :bio
      t.string :password_digest
      t.boolean :admin
      t.boolean :private

      t.timestamps
    end
  end
end
