class CreateProjectFeatures < ActiveRecord::Migration
  def migrate(direction)
    super
    # Create a default
    if direction == :up
      ProjectFeatures.create!(name: '学区房')
      ProjectFeatures.create!(name: '无敌江景')
      ProjectFeatures.create!(name: '花园洋房')
      ProjectFeatures.create!(name: '繁华商圈')
      ProjectFeatures.create!(name: '海景楼盘')
      ProjectFeatures.create!(name: '宜居豪宅')
      ProjectFeatures.create!(name: '写字楼')
      ProjectFeatures.create!(name: '婚房')
      ProjectFeatures.create!(name: '高档社区')
      ProjectFeatures.create!(name: '投资热点')
      ProjectFeatures.create!(name: '刚需首选')
    end
  end

  def change
    create_table :project_features do |t|
      t.string :name

      t.timestamps
    end
  end
end
