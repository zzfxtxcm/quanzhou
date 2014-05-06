ActiveAdmin.register Area do


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

  # menu :label => proc{ I18n.t("active_admin.information.menu.information") }
  menu false

  permit_params [:name]

  index :title => proc{ I18n.t("active_admin.areas.title") } do
    selectable_column
    id_column
    column I18n.t("active_admin.areas.list.name"), :name
    actions
  end

  filter :name, :label => I18n.t("active_admin.areas.search.name")
  filter :created_at, :label => I18n.t("active_admin.areas.search.created_at")

  form do |f|
    f.inputs "" do
      f.input :name, :label => I18n.t("active_admin.areas.form.name")
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit(:area => [:name])
    end
  end
end
