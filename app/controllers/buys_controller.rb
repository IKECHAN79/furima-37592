class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]



  def index
    @buy_address = BuyAddress.new
    if current_user == @item.user || @item.buy.present?
       redirect_to root_path
    end
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: buy_params[:token],
        currency: 'jpy'
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

  def set_item
    @item = Item.find(params[:item_id])
  end
end
