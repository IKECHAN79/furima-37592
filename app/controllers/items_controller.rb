class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy ]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
  end

  def edit
    unless current_user == @item.user
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
       redirect_to item_path(@item)
   else
     render :edit
   end
  end

  def destroy
    if @item.user == current_user
       @item.destroy
    end
       redirect_to root_path
  end
  

  
  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_more, :price,:category_id, :condition_id, :delivery_charge_id, :prefecture_id, :days_to_ship_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
