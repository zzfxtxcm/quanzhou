class AddPropertyTypeAndUnitsToIntentionToRegisters < ActiveRecord::Migration
  def change
    add_column :intention_to_registers, :property_type, :string
    add_column :intention_to_registers, :units, :string
  end
end
