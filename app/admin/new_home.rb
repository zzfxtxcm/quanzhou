ActiveAdmin.register NewHome do



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

  menu priority: 1, :label => proc{ I18n.t("active_admin.new_homes.menu.new_home") }

  action_item do
    link_to "区域管理", "/admin/areas"
  end

  action_item do
    link_to "版块管理", "/admin/sections"
  end

  action_item do
    link_to "开发商管理", "/admin/developers"
  end

  action_item do
    link_to "开盘信息管理", "/admin/information_estate_openeds"
  end

  permit_params [:name]

  index :title => proc{ I18n.t("active_admin.new_homes.title") } do
    selectable_column
    id_column
    column I18n.t("active_admin.new_homes.list.name"), :name
    actions
  end

  filter :status, :label => I18n.t("active_admin.new_homes.search.status")
  filter :area, :label => I18n.t("active_admin.new_homes.search.area")
  filter :developers, :label => I18n.t("active_admin.new_homes.search.developers")
  filter :name, :label => I18n.t("active_admin.new_homes.search.name")
  filter :price, :label => I18n.t("active_admin.new_homes.search.price")
  filter :created_at,
         :label => I18n.t("active_admin.new_homes.search.created_at")

  form do |f|
    within @head do
      script :src => javascript_path('custom/jquery.bgiframe.js'), :type => "text/javascript"
      script :src => javascript_path('http://api.map.baidu.com/api?v=2.0&ak=NXagVEyXSs6AmnrCNXl7pKHo'), :type => "text/javascript"
    end
    f.inputs "基本信息" do
      f.input :name,
              :wrapper_html => { :style => "width: 48%" },
              :label => I18n.t("active_admin.new_homes.form.name")
      f.input :price,
              :wrapper_html => { :class => "left", :style => "width:48%" },
              :label => I18n.t("active_admin.new_homes.form.price")
      f.input :tel,
              :wrapper_html => { :class => "right", :style => "width:48%" },
              :label => I18n.t("active_admin.new_homes.form.tel")
      f.input :project_address,
              :wrapper_html => { :class => "index_content left", :style => "width: 48%" },
              :label => I18n.t("active_admin.new_homes.form.project_address")
      f.input :sales_address,
              :wrapper_html => { :class => "right", :style => "width: 48%" },
              :label => I18n.t("active_admin.new_homes.form.sales_address")
      f.input :map_address,
              :wrapper_html => { :class => "index_content", :style => "width: 48%" },
              :label => I18n.t("active_admin.new_homes.form.map_address"),
              :input_html => { :readonly => true }
      f.form_buffers.last << "<div id=\"selectItem\" class=\"selectItemhidden\">
                                <div id=\"selectItemAd\" class=\"selectItemtit bgc_ccc\">
                                  <h2 id=\"selectItemTitle\" class=\"selectItemleft\">请选择城市</h2>
                                  <div id=\"selectItemClose\" class=\"selectItemright\">关闭</div>
                                </div>
                                <div id=\"selectItemCount\" class=\"selectItemcont\">
                                  <div id=\"selectSub\">
                                    <div id=\"r-result\" style=\"width:250px; float:right \">
                                      <div id=\"search\" style=\"margin-top:10px; margin-left:10px;\">
                                        搜索：
                                        <input type=\"text\" size=\"20\" name=\"keyword\" id=\"keyword\" style=\"width:100px\" />
                                        <input type=\"submit\" value=\"提交\" onclick=\"MblogDotccMap(document.getElementById('keyword').value)\" />
                                      </div>
                                      <div id=\"results_info\" style=\"margin-top:10px; margin-left:10px;\"></div>
                                    </div>
                                    <div id=\"l-map\" style=\"height:550px; width: 650px; float:left; \"></div>
                                  </div>
                                </div>
                              </div>".html_safe
      f.form_buffers.last << javascript_tag("
                                             var map = new BMap.Map(\"l-map\");
                                             var point = new BMap.Point(117.676205,24.517065);

                                             map.centerAndZoom(point, 13);

                                             //var marker = new BMap.Marker(point);  // 创建标注
                                             //map.addOverlay(marker);              // 将标注添加到地图中
                                             //marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画

                                             // 控件

                                             map.addControl(new BMap.NavigationControl());
                                             map.addControl(new BMap.ScaleControl());
                                             map.addControl(new BMap.OverviewMapControl());

                                             function MblogDotccMap(keyword) {
                                              var local = new BMap.LocalSearch(map, {renderOptions: {map: map, panel: \"results_info\"}});
                                              map.panBy(point);
                                              local.search(keyword);
                                              local.getResults();
                                              // 阻止提交
                                              if (event) event.returnValue = false;
                                                return false;
                                             }

                                             // 加载值到输入框
                                             map.addEventListener('click', function(e){ document.getElementById('new_home_map_address').value = e.point.lng + ', ' + e.point.lat;});
                                            ")
      f.input :area,
              :prompt => true,
              :wrapper_html => { :style => "width: 48%" },
              :label => I18n.t("active_admin.new_homes.form.area")
      f.input :section,
              :prompt => true,
              :wrapper_html => { :style => "width: 48%" },
              :label => I18n.t("active_admin.new_homes.form.section")
      f.input :developers,
              :prompt => true,
              :wrapper_html => { :style => "width: 48%" },
              :label => I18n.t("active_admin.new_homes.form.developers")
      f.input :agents,
              :wrapper_html => { :style => "width: 48%" },
              :label => I18n.t("active_admin.new_homes.form.agents")
    end

    f.inputs "楼盘信息" do
      f.input :covers,
              :wrapper_html => { :class => "left", :style => "width: 48%" },
              :label => I18n.t("active_admin.new_homes.form.covers")
      f.input :gfa,
              :wrapper_html => { :class => "right", :style => "width: 48%" },
              :label => I18n.t("active_admin.new_homes.form.gfa")
      f.input :pool_area,
              :wrapper_html => { :class => "index_content left", :style => "width: 48%" },
              :label => I18n.t("active_admin.new_homes.form.pool_area")
      f.input :parking,
              :wrapper_html => { :class => "right", :style => "width: 48%" },
              :label => I18n.t("active_admin.new_homes.form.parking")
      f.input :number_users,
              :wrapper_html => { :class => "index_content", :style => "width: 48%" },
              :label => I18n.t("active_admin.new_homes.form.number_users")
      f.input :construction_category,
              :prompt => true,
              :wrapper_html => { :style => "width: 48%" },
              :label => I18n.t("active_admin.new_homes.form.construction_category")
      f.input :building_towers,
              :wrapper_html => { :style => "width: 48%" },
              :label => I18n.t("active_admin.new_homes.form.building_towers")
      f.input :floors_case,
              :wrapper_html => { :class => "left", :style => "width: 48%" },
              :label => I18n.t("active_admin.new_homes.form.floors_case")
      f.input :main_units,
              :wrapper_html => { :class => "right", :style => "width: 48%" },
              :label => I18n.t("active_admin.new_homes.form.main_units")
      f.input :house_area,
              :wrapper_html => { :class => "index_content", :style => "width: 48%" },
              :label => I18n.t("active_admin.new_homes.form.house_area")
      f.input :area_range,
              :prompt => true,
              :hint => f.template.content_tag(:span, "平方米"),
              :wrapper_html => { :style => "width: 48%" },
              :label => I18n.t("active_admin.new_homes.form.area_range")
      f.input :greening_rate,
              :wrapper_html => { :class => "left", :style => "width: 48%" },
              :label => I18n.t("active_admin.new_homes.form.greening_rate")
      f.input :volume_rate,
              :wrapper_html => { :class => "right", :style => "width:48%" },
              :label => I18n.t("active_admin.new_homes.form.volume_rate")
      f.input :fit,
              :input_html => { :rows => "5" },
              :wrapper_html => { :class => "left", :style => "width:48%" },
              :label => I18n.t("active_admin.new_homes.form.fit")
      f.input :property,
              :input_html => { :rows => "5" },
              :wrapper_html => { :class => "right", :style => "width:48%" },
              :label => I18n.t("active_admin.new_homes.form.property")
      f.input :school,
              :input_html => { :rows => "5" },
              :wrapper_html => { :class => "left", :style => "width:48%" },
              :label => I18n.t("active_admin.new_homes.form.school")
      f.input :hospital,
              :input_html => { :rows => "5" },
              :wrapper_html => { :class => "right", :style => "width:48%" },
              :label => I18n.t("active_admin.new_homes.form.hospital")
      f.input :bank,
              :input_html => { :rows => "5" },
              :wrapper_html => { :class => "left", :style => "width:48%" },
              :label => I18n.t("active_admin.new_homes.form.bank")
      f.input :shopping,
              :input_html => { :rows => "5" },
              :wrapper_html => { :class => "right", :style => "width:48%" },
              :label => I18n.t("active_admin.new_homes.form.shopping")
      f.input :neighborhoods,
              :input_html => { :rows => "5" },
              :wrapper_html => { :class => "left", :style => "width:48%" },
              :label => I18n.t("active_admin.new_homes.form.neighborhoods")
      f.input :landscapes,
              :input_html => { :rows => "5" },
              :wrapper_html => { :class => "right", :style => "width:48%" },
              :label => I18n.t("active_admin.new_homes.form.landscapes")
      f.input :bus,
              :input_html => { :rows => "5" },
              :wrapper_html => { :class => "left", :style => "width:48%" },
              :label => I18n.t("active_admin.new_homes.form.bus")
      f.input :car,
              :input_html => { :rows => "5" },
              :wrapper_html => { :class => "right", :style => "width:48%" },
              :label => I18n.t("active_admin.new_homes.form.car")
      f.input :property_type,
              :prompt => true,
              :wrapper_html => { :style => "width:48%" },
              :label => I18n.t("active_admin.new_homes.form.property_type")
      f.input :project_features,
              :prompt => true,
              :wrapper_html => { :style => "width:48%" },
              :label => I18n.t("active_admin.new_homes.form.project_features")
      f.input :content,
              :label => false,
              :as => :ckeditor
      f.input :status,
              :prompt => true,
              :wrapper_html => { :style => "width:48%" },
              :label => I18n.t("active_admin.new_homes.form.status")
      f.input :new_home_thumb,
              :wrapper_html => { :style => "width:48%" },
              :hint => f.object.new_home_thumb.present? \
                       ? f.template.image_tag(f.object.new_home_thumb.url(:thumb))
                       : f.template.content_tag(:span, "未传图片"),
              :label => I18n.t("active_admin.new_homes.form.new_home_thumb")
      f.input :new_home_thumb_cache, :as => :hidden
    end

    f.inputs I18n.t("active_admin.alubms.alubms") do
      f.has_many :albums do |album|
        album.input :name, :label => "名称"
        album.input :url, :as => :file,
                          :label => "相册地址",
                          :hint => album.object.url.nil? \
                                   ? album.template.content_tag(:span, "No Image Yet")
                                   : album.template.image_tag(album.object.url.url(:normal))
        album.input :_destroy, :as => :boolean, :required => false, :label => '选定删除'
        # album.actions do
        #   album.action :submit
        # end
      end
    end

    f.inputs I18n.t("active_admin.apartment.apartment") do
      f.has_many :apartments do |apartment|
        apartment.input :name, :label => "名称"
        apartment.input :apartment_name, :label => "户型"
        apartment.input :area, :label => "面积"
        apartment.input :apartment_thumb, :as => :file,
                                          :label => "图片地址",
                                          :hint => apartment.object.apartment_thumb.nil? \
                                                   ? apartment.template.content_tag(:span, "No Image Yet")
                                                   : apartment.template.image_tag(apartment.object.apartment_thumb.url(:thumb))
      end
    end

    f.actions
  end

  controller do
    def permitted_params
      params.permit!
      # params.permit(:new_home => [:name,
      #                             :price,
      #                             :tel,
      #                             :map_address,
      #                             :project_address,
      #                             :sales_address,
      #                             :area_id,
      #                             :section_id,
      #                             :developers_id,
      #                             :agents,
      #                             :covers,
      #                             :gfa,
      #                             :pool_area,
      #                             :parking,
      #                             :number_users,
      #                             :construction_category_id,
      #                             :building_towers,
      #                             :floors_case,
      #                             :main_units,
      #                             :house_area,
      #                             :area_range_id,
      #                             :greening_rate,
      #                             :volume_rate,
      #                             :fit,
      #                             :property,
      #                             :school,
      #                             :hospital,
      #                             :bank,
      #                             :shopping,
      #                             :neighborhoods,
      #                             :landscapes,
      #                             :bus,
      #                             :car,
      #                             :property_type_id,
      #                             :content,
      #                             :status_id,
      #                             :new_home_thumb,
      #                             albums_attributes: [:name, :file]])
    end
  end
end
