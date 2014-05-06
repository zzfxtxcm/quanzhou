class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.integer :category_id
      t.string :title
      t.string :style
      t.string :information_thumb
      t.string :keywords
      t.text :description
      t.text :content
      t.integer :listorder
      t.integer :status

      t.timestamps
    end

    add_index :information, [:category_id, :title, :created_at]
  end
end
