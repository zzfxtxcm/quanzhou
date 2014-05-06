ActiveAdmin.register Activity do


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

  menu :label => proc{ I18n.t("active_admin.activities.menu.activity") }

  permit_params [:title, :content, :opening_time]

  index :title => proc{ I18n.t("active_admin.activities.title") } do
    selectable_column
    id_column
    column I18n.t("active_admin.activities.list.title"), :title
    column I18n.t("active_admin.activities.list.opening_time"), :opening_time
    actions
  end

  filter :title, :label => I18n.t("active_admin.activities.search.title")
  filter :opening_time, :label => I18n.t("active_admin.activities.search.opening_time")

  form do |f|
    f.inputs "" do
      f.input :title,
              :label => I18n.t("active_admin.activities.form.title")
      f.input :content,
              :label => I18n.t("active_admin.activities.form.content"),
              :as => :ckeditor
      f.input :opening_time,
              :label => I18n.t("active_admin.activities.form.content"),
              :as => :datepicker
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit(:activity => [:title,
                                  :content,
                                  :opening_time])
    end
  end

end
