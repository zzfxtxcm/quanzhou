class IntentionToRegistersController < ApplicationController

  def create
    @intention_to_register = IntentionToRegister.new(intention_to_register_params)
    if @intention_to_register.save
      session[:inention_id]=@intention_to_register.id
      flash[:success] = "您的信息我们已经收到，会尽快的联系您。是否继续完成信息登记？"
      redirect_to root_url
    else

      flash[:err] = "请填写相关信息再提交!"
      redirect_to root_url
    end
  end

  def index
    @areas = Area.all
    @inention_id=session[:inention_id]
    @intention_to_register = IntentionToRegister.find(@inention_id)
  end

  def update
    @intention = IntentionToRegister.find(params[:id])
    if @intention.update_attributes(intention_to_register_params)
      flash[:success] = "提交成功，谢谢参与！"
      redirect_to root_url
    else
      render 'edit'
    end
  end


  private

    def intention_to_register_params
      params.require(:intention_to_register).permit(:name,
                                                    :qq,
                                                    :tel,
                                                    :new_home_id,
                                                    :sex,
                                                    :budget,
                                                    :area,
                                                    :email,
                                                    :property_type,
                                                    :units)
    end
end
