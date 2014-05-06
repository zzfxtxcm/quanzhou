# encoding: utf-8

include NewHomesHelper

ActiveAdmin.register InformationEstateOpened do


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

  menu false

  permit_params [:title, :opening_time, :delivery_time]

  index :title => proc{ I18n.t("active_admin.information_estate_openeds.title") } do
    selectable_column
    id_column
    column I18n.t("active_admin.information_estate_openeds.list.title"), :title
    column I18n.t("active_admin.information_estate_openeds.list.new_home"), :new_home
    column I18n.t("active_admin.information_estate_openeds.list.opening_time"), :opening_time
    column I18n.t("active_admin.information_estate_openeds.list.delivery_time"), :delivery_time
    actions
  end

  filter :new_home,
         :collection => new_homes_dropdown(NewHome.all),
         :label => I18n.t("active_admin.information_estate_openeds.search.new_home")

  form do |f|
    f.inputs "" do
      f.input :new_home,
              :prompt => true,
              :collection => new_homes_dropdown(NewHome.all),
              :label => I18n.t("active_admin.information_estate_openeds.form.new_home")
      f.input :title,
              :label => I18n.t("active_admin.information_estate_openeds.form.title")
      f.input :price,
              :label => I18n.t("active_admin.information_estate_openeds.form.price")
      f.input :opening_time,
              :label => I18n.t("active_admin.information_estate_openeds.form.opening_time")
      f.input :delivery_time,
              :label => I18n.t("active_admin.information_estate_openeds.form.delivery_time")
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit(:information_estate_opened => [:new_home_id,
                                                   :title,
                                                   :price,
                                                   :opening_time,
                                                   :delivery_time])
    end
  end
end
