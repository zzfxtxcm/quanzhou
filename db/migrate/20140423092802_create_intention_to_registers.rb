class CreateIntentionToRegisters < ActiveRecord::Migration
  def change
    create_table :intention_to_registers do |t|
      t.string :name
      t.string :qq
      t.string :tel
      t.integer :new_home_id

      t.timestamps
    end
  end
end
