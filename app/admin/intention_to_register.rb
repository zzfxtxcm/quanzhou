ActiveAdmin.register IntentionToRegister do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  menu priority: 3, :label => proc{ I18n.t("active_admin.intention_to_registers.menu.intention_to_register") }

  permit_params [:new_home, :name, :qq, :tel]

  index :title => proc{ I18n.t("active_admin.intention_to_registers.title") } do
    selectable_column
    id_column
    column I18n.t("active_admin.intention_to_registers.list.new_home"), :new_home
    column I18n.t("active_admin.intention_to_registers.list.name"), :name
    column I18n.t("active_admin.intention_to_registers.list.tel"), :tel
    column I18n.t("active_admin.intention_to_registers.list.qq"), :qq
    actions
  end

  csv do
    column :new_home do |new_home|
      NewHome.find(new_home.new_home_id).name
    end
    column :name
    column :qq
    column :tel
    column :created_at
  end

  filter :new_home,
         :collection => new_homes_dropdown(NewHome.all),
         :label => I18n.t("active_admin.intention_to_registers.search.new_home")
  filter :created_at,
         :label => I18n.t("active_admin.intention_to_registers.search.created_at")
end
