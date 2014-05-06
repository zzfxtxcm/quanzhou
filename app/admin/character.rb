ActiveAdmin.register Character do


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

  menu :label => proc{ I18n.t("active_admin.characters.menu.character") }

  permit_params [:name, :content]

  index :title => proc{ I18n.t("active_admin.characters.title") } do
    selectable_column
    id_column
    column I18n.t("active_admin.characters.list.character_thumb") do |thumb|
      image_tag thumb.character_thumb.url(:normal)
    end
    column I18n.t("active_admin.characters.list.name"), :name
    column I18n.t("active_admin.characters.list.title"), :title
    actions
  end

  filter :name, :label => I18n.t("active_admin.characters.search.name")

  form do |f|
    f.inputs "" do
      f.input :title,
              :label => I18n.t("active_admin.characters.form.title")
      f.input :name,
              :label => I18n.t("active_admin.characters.form.name")
      f.input :content,
              :label => I18n.t("active_admin.characters.form.content"),
              :as => :ckeditor
      f.input :character_thumb,
              :hint => f.object.character_thumb.present? \
                       ? f.template.image_tag(f.object.character_thumb.url(:normal))
                       : f.template.content_tag(:span, "未传图片"),
              :label => I18n.t("active_admin.characters.form.character_thumb")
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit(:character => [:title,
                                   :name,
                                   :content,
                                   :character_thumb])
    end
  end

end
