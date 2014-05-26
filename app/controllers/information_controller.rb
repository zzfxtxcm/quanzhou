class InformationController < ApplicationController
  add_breadcrumb "馨窝网首页", :root_path
  add_breadcrumb "资讯列表", :information_index_path

  def index
    @information = Information.order('created_at DESC')
                              .paginate(page: params[:page])
                              .per_page(10)
    @information.total_entries = 1000 if(@information.total_entries > 1000)

    @keyword = Sunspot.search(Information) do
      keywords params[:keyword]
      with(:information_type_id).equal_to(params[:information_type_id]) if params[:information_type_id].present?
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

  def show
    @information = Information.find(params[:id])

    add_breadcrumb "正文", information_path    
  end
end
