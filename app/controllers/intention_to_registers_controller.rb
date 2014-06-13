class IntentionToRegistersController < ApplicationController
  $id =0
  def create
    @intention_to_register = IntentionToRegister.new(intention_to_register_params)
    if @intention_to_register.save
      $id=@intention_to_register.id
      redirect_to '/intention_to_registers'
    else

      flash[:err] = "请填写相关信息再提交!"
      redirect_to root_url
    end
  end

  def index
    @areas = Area.all
    @inention_id=$id
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
