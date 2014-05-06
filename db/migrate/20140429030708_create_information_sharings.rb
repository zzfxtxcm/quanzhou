class CreateInformationSharings < ActiveRecord::Migration
  def change
    create_table :information_sharings do |t|
      t.string :title
      t.string :url
      t.text :content
      t.string :information_sharing_thumb

      t.timestamps
    end
  end
end
