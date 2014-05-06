class CreateStatuses < ActiveRecord::Migration
  def migrate(direction)
    super
    # Create a default
    if direction == :up
      Status.create!(name: '即将开盘')
      Status.create!(name: '待售')
      Status.create!(name: '在售')
      Status.create!(name: '优惠')
      Status.create!(name: '热推')
      Status.create!(name: '公开预约')
      Status.create!(name: '已售完')
      Status.create!(name: '即将收官')
      Status.create!(name: '地块')
    end
  end

  def change
    create_table :statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
