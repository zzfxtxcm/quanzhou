class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.text :content
      t.datetime :opening_time

      t.timestamps
    end
  end
end
