class CharactersController < ApplicationController
  def index
  	@Characters = Character.order('created_at DESC')
		                        			  .paginate(page: params[:page])
		                        			  .per_page(10)
  end

  def show
  	@Characters = Character.find(params[:id])
  end
end
