class StaticPagesController < ApplicationController
  respond_to :html, :xml, :json

  def home
    @areas = Area.all
    @sections = Section.all
    @intention_to_register = IntentionToRegister.new
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
end
