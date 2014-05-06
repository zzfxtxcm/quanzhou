class AddSourceToInformation < ActiveRecord::Migration
  def change
    add_column :information, :source, :string
  end
end
