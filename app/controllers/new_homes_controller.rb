class NewHomesController < ApplicationController
  def index
    @new_homes = NewHome.order('created_at DESC')
                        .paginate(page: params[:page])
                        .per_page(5)

    @keyword = Sunspot.search(NewHome) do
      keywords params[:keyword]
      with(:area_id).equal_to(params[:area_id]) if params[:area_id].present?
      with(:section_id).equal_to(params[:section_id]) if params[:section_id].present?
      with(:area_range_id).equal_to(params[:area_range_id]) if params[:area_range_id].present?
      with(:property_type_id).equal_to(params[:property_type_id]) if params[:property_type_id].present?
      with(:price).between(params[:mix]..params[:max]) if params[:mix].present? && params[:max].present?
      order_by :created_at, :desc
      paginate :page => params[:page], :per_page => 5
    end

    @new_homes = @keyword.results

    respond_to do |format|
      format.html
      format.json { render json: @new_homes }
      format.js
    end
  end

  def show
    @areas = Area.all
    @sections = Section.all
    @new_home = NewHome.find(params[:id])
    @apartments = Apartment.where(new_home_id: params[:id])
    @intention_to_register = IntentionToRegister.new
    @news = Information.where(new_home_id: params[:id])
                       .order('created_at DESC')
                       .paginate(page: params[:page])
                       .per_page(9)

    @albums1=Album.where(new_home_id: params[:id] ,album_class_id:1)
    @albums2=Album.where(new_home_id: params[:id] ,album_class_id:2)
    @albums3=Album.where(new_home_id: params[:id] ,album_class_id:3)
    @albums4=Album.where(new_home_id: params[:id] ,album_class_id:4)
    @albums5=Album.where(new_home_id: params[:id] ,album_class_id:5)
    @albums6=Album.where(new_home_id: params[:id] ,album_class_id:6)
    @albums7=Album.where(new_home_id: params[:id] ,album_class_id:7)
    @albums8=Album.where(new_home_id: params[:id] ,album_class_id:8)
    if params[:pic]
      @albums = Album.where(new_home_id: params[:id],album_class_id:params[:pic])
                   .order('created_at DESC')
                   .paginate(page: params[:page])
                   .per_page(9)
    else
      @albums = Album.where(new_home_id: params[:id])
                   .order('created_at DESC')
                   .paginate(page: params[:page])
                   .per_page(9)
    end

  end
end
