ActiveAdmin.register User do


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

  menu :label => proc{ I18n.t("active_admin.users.menu.user") }

  permit_params :id, :email, :created_at, :updated_at

  index :title => proc{ I18n.t("active_admin.users.title") } do
    selectable_column
    id_column
    column I18n.t("active_admin.users.list.email"), :email
    column I18n.t("active_admin.users.list.sign_in_count"), :sign_in_count
    column I18n.t("active_admin.users.list.created_at"), :created_at
    actions
  end

  filter :email, :label => I18n.t("active_admin.users.search.email")
  filter :created_at, :label => I18n.t("active_admin.users.search.created_at")

  form do |f|
    f.inputs "" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  sidebar :help, :only => :index do
    "如果你对网站后台管理有问题"
  end

end
