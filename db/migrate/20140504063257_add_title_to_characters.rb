class AddTitleToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :title, :string
  end
end
