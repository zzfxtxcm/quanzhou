class AddProjectFeaturesIdToNewHomes < ActiveRecord::Migration
  def change
    add_column :new_homes, :project_features_id, :integer
    add_index :new_homes, :project_features_id
  end
end
