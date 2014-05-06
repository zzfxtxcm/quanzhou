class AddRecommendToGroupBuying < ActiveRecord::Migration
  def change
    add_column :group_buyings, :recommend, :boolean
  end
end
