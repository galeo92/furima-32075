class ItemsController < ApplicationController
   before_action :authenticate_user!, except:[:index, :show]
   before_action :set_item, only: [:edit, :show, :update]
   before_action :move_to_index, only:[:edit, :update]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_path
    else
      render :new
    end

  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to items_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :status_id, :delivery_charge_id, :shipping_area_id, :duration_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end
  
  def set_item
    @item = Item.find(params[:id])
  end
end

