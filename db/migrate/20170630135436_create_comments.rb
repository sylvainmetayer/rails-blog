class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.date :date
      t.references :user, index: true, foreign_key: true
      t.text :content
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end