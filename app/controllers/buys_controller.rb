class BuysController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new
    #if @item.user_id != current_user.id || @item.buy != nil
     #  redirect_to root_path
    #end
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: buy_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @buy_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  

  private

  def buy_params
    params.require(:buy_address).permit(:post_code, :prefecture_id, :city, :address, :phone_number, :building_name ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
