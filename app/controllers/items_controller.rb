class ItemsController < ApplicationController
   before_action :authenticate_user!, except:[:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.includes(:user).order("created_at DESC")
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_path
    else
      render :new
    end

  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :status_id, :delivery_charge_id, :shipping_area_id, :duration_id, :price, :image).merge(user_id: current_user.id)
  end

end
