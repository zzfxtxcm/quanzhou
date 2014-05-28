module NewHomesHelper

  def new_homes_dropdown(items)
    result = []

    if ActiveRecord::Base.connection.table_exists? 'new_homes'
      items.map do |item|
        result << [PinYin.of_string(item.name)[0][0].upcase.to_s + " - " + item.name, item.id]
      end
    end

    result.sort
  end

  def render_option_of_total_area(option)
    css_class_name ||= "btn btn-link "
    style_name ||= "color: #2db8ad"
    css_class_name = "btn btn-inverse" if option.blank?
    style_name = "background: #2db8ad;color:#fff" if option.blank?
    link_to("全部", new_homes_path(:section_id => params[:section_id],
                                   :status_id => params[:status_id],   
                                   :area_range_id => params[:area_range_id],
                                   :property_type_id => params[:property_type_id],
                                   :mix => params[:mix],
                                   :max => params[:max],
                                   :utf8 => params[:utf8]),
                    :class => "#{css_class_name}",
                    :style => "#{style_name}")
  end

  def render_option_of_single_area(key, value)
    css_class_name ||= "btn btn-link"
    style_name ||= "margin:0 "
    css_class_name = "btn btn-inverse" if params[:area_id].to_i == value.to_i
    style_name = "background: #2db8ad;color:#fff" if params[:area_id].to_i == value.to_i
    total = NewHome.where(area_id: value).size
    link_to("#{key}(#{total})", new_homes_path(:area_id => value,
                                :status_id => params[:status_id],
                                :section_id => params[:section_id],
                                :area_range_id => params[:area_range_id],
                                :property_type_id => params[:property_type_id],
                                :mix => params[:mix],
                                :max => params[:max],
                                :utf8 => params[:utf8]),
                 :class => "#{css_class_name}",
                 :style => "#{style_name}")
  end

  def render_option_of_total_price(mix, max)
    css_class_name ||= "btn btn-link"
    style_name ||= "color: #2db8ad"
    css_class_name = "btn btn-inverse" if mix.blank? && max.blank?
    style_name = "background: #2db8ad;color:#fff" if mix.blank? && max.blank?
    link_to("不限", new_homes_path(:area_id => params[:area_id],
                                   :status_id => params[:status_id],
                                   :section_id => params[:section_id],
                                   :area_range_id => params[:area_range_id],
                                   :property_type_id => params[:property_type_id],
                                   :utf8 => params[:utf8]),
                    :class => "#{css_class_name}",
                    :style => "#{style_name}")
  end

  def render_option_of_single_price(mix, max)
    css_class_name ||= "btn btn-link"
    style_name ||= "margin:0 "
    css_class_name = "btn btn-inverse" if params[:mix].to_i == mix && params[:max].to_i == max
    style_name = "background: #2db8ad;color:#fff" if params[:mix].to_i == mix && params[:max].to_i == max
    link_to("#{mix} - #{max}", new_homes_path(:area_id => params[:area_id],
                                              :status_id => params[:status_id],
                                              :section_id => params[:section_id],
                                              :area_range_id => params[:area_range_id],
                                              :property_type_id => params[:property_type_id],
                                              :mix => mix,
                                              :max => max,
                                              :utf8 => params[:utf8]),
                 :class => "#{css_class_name}",
                 :style => "#{style_name}")
  end

  def render_option_of_single_price_index(mix, max, stylesheets)
    link_to("#{mix}-#{max}", new_homes_path(:area_id => params[:area_id],
                                              :status_id => params[:status_id],
                                              :section_id => params[:section_id],
                                              :area_range_id => params[:area_range_id],
                                              :property_type_id => params[:property_type_id],
                                              :mix => mix,
                                              :max => max,
                                              :utf8 => params[:utf8]),
                 :class => "areab",
                 :style => "#{stylesheets}")
  end

  def render_option_of_status_id(id)
    name = Status.find(id).name
    link_to(name, new_homes_path(:area_id => params[:area_id],
                                :section_id => params[:section_id],
                                :area_range_id => params[:area_range_id],
                                :property_type_id => params[:property_type_id],
                                :mix => params[:mix],
                                :max => params[:max],
                                :utf8 => params[:utf8],
                                :status_id => id))
                    
  end  

  def render_option_of_total_status_id()
    link_to("全部", new_homes_path(:area_id => params[:area_id],
                                :section_id => params[:section_id],
                                :area_range_id => params[:area_range_id],
                                :property_type_id => params[:property_type_id],
                                :mix => params[:mix],
                                :max => params[:max],
                                :utf8 => params[:utf8]))
  end
  def render_option_of_total_area_range(option)
    css_class_name ||= "btn btn-link"
    style_name ||= "color: #2db8ad"
    css_class_name = "btn btn-inverse" if option.blank?
    style_name = "background: #2db8ad;color:#fff" if option.blank?
    link_to("不限", new_homes_path(:section_id => params[:section_id],
                                   :status_id => params[:status_id],
                                   :area_id => params[:area_id],
                                   :property_type_id => params[:property_type_id],
                                   :mix => params[:mix],
                                   :max => params[:max],
                                   :utf8 => params[:utf8]),
                    :class => "#{css_class_name}",
                    :style => "#{style_name}")
  end

  def render_option_of_single_area_range(key, value)
    css_class_name ||= "btn btn-link"
    style_name ||= "margin:0 "
    css_class_name = "btn btn-inverse" if params[:area_range_id].to_i == value.to_i
    style_name = "background: #2db8ad;color:#fff" if params[:area_range_id].to_i == value.to_i
    link_to("#{key}m²", new_homes_path(:area_id => params[:area_id],
                                :status_id => params[:status_id],
                                :section_id => params[:section_id],
                                :area_range_id => value,
                                :property_type_id => params[:property_type_id],
                                :mix => params[:mix],
                                :max => params[:max],
                                :utf8 => params[:utf8]),
                 :class => "#{css_class_name}",
                 :style => "#{style_name}")
  end

  def render_option_of_single_area_range_index(key, value, stylesheets)
    link_to("#{key}m²", new_homes_path(:area_id => params[:area_id],
                                :status_id => params[:status_id],
                                :section_id => params[:section_id],
                                :area_range_id => value,
                                :property_type_id => params[:property_type_id],
                                :mix => params[:mix],
                                :max => params[:max],
                                :utf8 => params[:utf8]),
                 :class => "areaa",
                 :style => "#{stylesheets}")
  end
end
