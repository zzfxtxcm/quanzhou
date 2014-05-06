class CreatePropertyTypes < ActiveRecord::Migration
  def migrate(direction)
    super
    # Create a default
    if direction == :up
      PropertyType.create!(name: '普通住宅')
      PropertyType.create!(name: '公寓')
      PropertyType.create!(name: '花园式洋房')
      PropertyType.create!(name: '酒店式公寓')
      PropertyType.create!(name: '商住两用')
      PropertyType.create!(name: '别墅')
      PropertyType.create!(name: '写字楼')
      PropertyType.create!(name: '商铺')
      PropertyType.create!(name: '情景洋房')
      PropertyType.create!(name: '高层')
      PropertyType.create!(name: '城市综合体')
    end
  end

  def change
    create_table :property_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
