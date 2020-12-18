require 'rails_helper'
describe PurchaseAddress do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it "全項目正しく記入すれば出品できる" do
        expect(@purchase_address).to be_valid
      end
      it "building_nameがなくでも保存ができる" do
        expect(@purchase_address).to be_valid
        @purchase_address.building_name = nil
      end
    end


    context '商品出品がうまくいかないとき' do
      it "postal_codeが空だと登録できない" do
        @purchase_address.postal_code = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "shipping_area_idが空では登録できない" do
         @purchase_address.shipping_area_id = ""
         @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipping area can't be blank")
      end
      it "shipping_area_idが「1」では登録できない" do
        @purchase_address.shipping_area_id = 1
        @purchase_address.valid?
       expect(@purchase_address.errors.full_messages).to include("Shipping area を正しく入力して下さい")
     end
      it "cityが空では登録できない" do
        @purchase_address.city = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空では登録できない" do
        @purchase_address.address = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空では登録できない" do
         @purchase_address.phone_number = ""
         @purchase_address.valid?
         expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "postal_codeは「-」がなければ登録できない" do
         @purchase_address.postal_code = "1234567"
         @purchase_address.valid?
         expect(@purchase_address.errors.full_messages).to include("Postal code を正しく入力して下さい")
      end
      it "phone_numberは12桁以上は登録できない" do
        @purchase_address.phone_number = "090123456789"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "shipping_area_idが「1」では登録できない" do
        @purchase_address.postal_code = "1"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code を正しく入力して下さい")
      end
      it "tokenが空では登録できない" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idがないと登録ができない" do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it "item_idがないと登録ができない" do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it "phone_numberは英数混合では登録できない" do
        @purchase_address.phone_number = "090abcd1234"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number を正しく入力して下さい")
      end
    end
  end
end
