class CreateNewHomes < ActiveRecord::Migration
  def change
    create_table :new_homes do |t|
      t.string :name # 名称
      t.integer :price # 均价
      t.string :tel # 电话
      t.string :project_address # 项目地址
      t.string :sales_address # 售楼地址
      t.integer :area_id # 区域
      t.integer :developers_id # 开发商
      t.string :permit # 许可证
      t.string :agents # 代理商
      t.string :covers # 占地面积
      t.string :gfa # 建筑面积
      t.string :pool_area # 公摊面积
      t.string :parking # 车位情况
      t.string :number_users # 总户数
      t.string :construction_category # 建筑类型
      t.string :building_towers # 建筑栋数
      t.string :floors_case # 楼层情况
      t.string :main_units # 主力户型
      t.string :house_area # 户型面积
      t.string :greening_rate # 绿化率
      t.string :volume_rate # 容积率
      t.string :fit # 装修情况
      t.string :property # 产权
      t.string :school # 学校
      t.string :hospital # 医院
      t.string :bank # 银行
      t.string :shopping # 购物中心
      t.string :neighborhoods # 小区配套
      t.string :landscapes # 自然景物
      t.string :bus # 公交
      t.string :car # 自驾
      t.text :content # 楼盘介绍

      t.timestamps
    end

    add_index :new_homes, [:name, :price, :area_id]
  end
end
