class CreateAreaRanges < ActiveRecord::Migration
  def migrate(direction)
    super
    # Create a default
    if direction == :up
      AreaRange.create!(name: '0-50')
      AreaRange.create!(name: '50-90')
      AreaRange.create!(name: '90-120')
      AreaRange.create!(name: '120-200')
      AreaRange.create!(name: '>200')
    end
  end

  def change
    create_table :area_ranges do |t|
      t.string :name

      t.timestamps
    end
  end
end
