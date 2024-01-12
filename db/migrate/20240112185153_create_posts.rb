class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :commentssCounter
      t.integer :likesCounter

      t.timestamps
    end
  end
end
