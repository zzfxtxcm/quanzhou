class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.text :content
      t.string :character_thumb

      t.timestamps
    end
  end
end
