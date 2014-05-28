class AddHitToInformation < ActiveRecord::Migration
  def change
    add_column :information, :hit, :integer
  end
end
