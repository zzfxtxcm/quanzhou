include NewHomesHelper

ActiveAdmin.register GroupBuying do


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

  menu priority: 2, :label => proc{ I18n.t("active_admin.group_buyings.menu.group_buying") }

  permit_params [:price, :start_time, :start_time]

  index :title => proc{ I18n.t("active_admin.group_buyings.title") } do
    selectable_column
    id_column
    column I18n.t("active_admin.group_buyings.list.new_home"), :new_home
    column I18n.t("active_admin.group_buyings.list.start_time"), :start_time
    column I18n.t("active_admin.group_buyings.list.end_time"), :end_time
    actions
  end

  filter :new_home,
         :collection => new_homes_dropdown(NewHome.all),
         :label => I18n.t("active_admin.group_buyings.search.new_home")
  filter :start_time,
         :label => I18n.t("active_admin.group_buyings.search.start_time")
  filter :end_time,
         :label => I18n.t("active_admin.group_buyings.search.end_time")
  filter :recommend,
         :label => I18n.t("active_admin.group_buyings.search.recommend")

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "" do
      f.input :new_home,
              :collection => new_homes_dropdown(NewHome.all),
              :prompt => true,
              :label => I18n.t("active_admin.group_buyings.form.new_home")
      f.input :explanation,
              :label => I18n.t("active_admin.group_buyings.form.explanation")
      f.input :start_time,
              :as => :datepicker,
              # :date.strftime("%Y-%m-%d %I:%M"),
              :label => I18n.t("active_admin.group_buyings.form.start_time")
      f.input :end_time,
              :as => :datepicker,
              :label => I18n.t("active_admin.group_buyings.form.end_time")
      f.input :recommend,
              :label => I18n.t("active_admin.group_buyings.form.recommend")
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit(:group_buying => [:new_home_id,
                                     :explanation,
                                     :start_time,
                                     :end_time,
                                     :recommend])
    end
  end
end
