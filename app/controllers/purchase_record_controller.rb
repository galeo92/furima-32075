class PurchaseRecordController < ApplicationController

  before_action :authenticate_user!, except:[:create]
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
    if current_user.id == @item.user_id || @item.purchase_record != nil
      redirect_to root_path
    end
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_record_params)

    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_address).permit(:postal_code, :city, :shipping_area_id, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_record_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
