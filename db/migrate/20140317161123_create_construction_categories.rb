class CreateConstructionCategories < ActiveRecord::Migration
  def migrate(direction)
    super
    # Create a default
    if direction == :up
      ConstructionCategory.create!(name: '低层住宅')
      ConstructionCategory.create!(name: '多层住宅')
      ConstructionCategory.create!(name: '小高层住宅')
      ConstructionCategory.create!(name: '高层住宅')
      ConstructionCategory.create!(name: '板楼和塔楼')
      ConstructionCategory.create!(name: '楼体结构')
      ConstructionCategory.create!(name: '超高层')
    end
  end

  def change
    create_table :construction_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
