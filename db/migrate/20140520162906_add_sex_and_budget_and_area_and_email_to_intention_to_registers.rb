class AddSexAndBudgetAndAreaAndEmailToIntentionToRegisters < ActiveRecord::Migration
  def change
    add_column :intention_to_registers, :sex, :integer
    add_column :intention_to_registers, :budget, :integer
    add_column :intention_to_registers, :area, :string
    add_column :intention_to_registers, :email, :string
    
    add_index :intention_to_registers, :new_home_id  end
end
