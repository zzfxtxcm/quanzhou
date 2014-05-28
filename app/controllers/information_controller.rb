class InformationController < ApplicationController
  add_breadcrumb "馨窝网首页", :root_path
  add_breadcrumb "资讯列表", :information_index_path

  def index

    @hot = Information.order('updated_at DESC').limit(8)
    @list = Information.order('hit DESC').limit(8)
    @information = Information.order('created_at DESC')
                              .paginate(page: params[:page])
                              .per_page(10)
    @information.total_entries = 1000 if(@information.total_entries > 1000)


    case params[:search_type]
    when "news"
      redirect_to URI.escape("http://#{params[:station]}.xinwowang.com/information?keyword=#{params[:keyword]}")
    when "new_homes"
      redirect_to URI.escape("http://#{params[:station]}.xinwowang.com/new_homes?keyword=#{params[:keyword]}")
    else
      @keyword = Sunspot.search(Information) do
        keywords params[:keyword]
        with(:information_type_id).equal_to(params[:information_type_id]) if params[:information_type_id].present?
        with(:category_id).equal_to(params[:category_id]) if params[:category_id].present?
        order_by :created_at, :desc
        paginate :page => params[:page], :per_page => 10
      end

      @information = @keyword.results

      respond_to do |format|
        format.html
        format.json { render json: @information }
        format.js
      end

    end

  end

  def show
    @hot = Information.order('updated_at DESC').limit(8)
    @list = Information.order('hit DESC ').limit(8)
    @information = Information.find(params[:id])
    if @information.hit.blank?
      @hit =rand(9)+1
    else
      @hit = @information.hit+rand(49)+1
    end
    @information.update_attribute(:hit, "#{@hit}" )

    add_breadcrumb "正文", information_path
  end
end
