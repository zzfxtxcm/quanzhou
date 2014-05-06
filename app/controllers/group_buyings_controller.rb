class GroupBuyingsController < ApplicationController
  def index
    @areas = Area.all
    @group_buyings = GroupBuying.order('created_at DESC')
                                .paginate(page: params[:page])
                                .per_page(5)
  end

  def show
    @group_buying = GroupBuying.find(params[:id])
  end
end
