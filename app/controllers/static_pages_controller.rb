class StaticPagesController < ApplicationController
  respond_to :html, :xml, :json

  def home
    @areas = Area.all
    @sections = Section.all
    @intention_to_register = IntentionToRegister.new

    if params[:area_id].blank?
      @new_select = NewHome.all
    else
      @new_select = NewHome.where("area_id = ?", params[:area_id])
    end
  end

  def help

  end

  def map
    @map_keyword = params[:map_keyword]
    unless @map_keyword.blank?
      @new_homes = NewHome.where("name LIKE ? AND map_address IS NOT NULL", '%' + @map_keyword + '%')
    else
      @new_homes = NewHome.where("map_address IS NOT NULL")
    end
  end

  def get_new_homes
    options = ""
    area_id = params[:area_id]
    if area_id.blank?
      data_for_select = NewHome.all
    else
      data_for_select = NewHome.where(:area_id => area_id).all
    end
    data_for_select.each do |s|
      options << "<option value=#{s.id}>#{s.name}</option>"
    end
    render :text => options
    # render :json => @data_for_select.map{|c| [c.id, c.name]}
  end
end
