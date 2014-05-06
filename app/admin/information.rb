# encoding: utf-8

include CategoriesHelper
include NewHomesHelper

ActiveAdmin.register Information do

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

  menu :label => proc{ I18n.t("active_admin.information.menu.information") }

  permit_params [:category, :title, :content]

  index :title => proc{ I18n.t("active_admin.information.title") } do
    selectable_column
    id_column
    column I18n.t("active_admin.information.list.title"), :title
    column I18n.t("active_admin.information.list.category"), :category
    column I18n.t("active_admin.information.list.source"), :source
    column I18n.t("active_admin.information.list.new_home"), :new_home
    actions
  end

  filter :category,
         :collection => proc { nested_dropdown(Category.all.arrange) },
         :label => I18n.t("active_admin.information.search.category")
  filter :new_home,
         :collection => new_homes_dropdown(NewHome.all),
         :label => I18n.t("active_admin.information.search.new_home")
  filter :title, :label => I18n.t("active_admin.information.search.title")
  filter :source, :label => I18n.t("active_admin.information.search.source")
  filter :information_type, :label => I18n.t("active_admin.information.search.information_type")
  filter :created_at,
         :label => I18n.t("active_admin.information.search.created_at")

  form do |f|
    f.inputs "采集地址" do
      "<li>
        <label class=\"label\">地址</label>
        <input id=\"url\" maxlength=\"255\" name=\"url\" value=\"hh\" type=\"text\">
      </li>".html_safe
    end
    f.inputs "" do
      f.input :information_type,
              :prompt => true,
              :label => I18n.t("active_admin.information.form.information_type")
      f.input :category, :collection => nested_dropdown(Category.all.arrange),
              :prompt => true,
              :label => I18n.t("active_admin.information.form.category")
      f.input :title,
              :label => I18n.t("active_admin.information.form.title")
      f.input :information_thumb,
              :label => I18n.t("active_admin.information.form.information_thumb")
      f.input :source,
              :label => I18n.t("active_admin.information.form.source")
      f.input :keywords,
              :label => I18n.t("active_admin.information.form.keywords")
      f.input :description,
              :label => I18n.t("active_admin.information.form.description"),
              :input_html => { :rows => 5 }
      f.input :content,
              :label => I18n.t("active_admin.information.form.content"),
              :as => :ckeditor
      f.input :new_home,
              :collection => new_homes_dropdown(NewHome.all),
              :prompt => true,
              :label => I18n.t("active_admin.information.form.new_home")
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit(:information => [:information_type_id,
                                     :category_id,
                                     :title,
                                     :style,
                                     :information_thumb,
                                     :source,
                                     :keywords,
                                     :description,
                                     :content,
                                     :listorder,
                                     :status,
                                     :new_home_id])
    end
  end
end
