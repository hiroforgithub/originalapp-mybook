class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.string :author, null: false
      t.integer :time
      t.string :url
      t.integer :category_id, null: false
      t.integer :review_id, null: false
      t.references :user, null: false, foreign_key: true 
      t.timestamps
    end
  end
end
