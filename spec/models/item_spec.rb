require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "全項目記入すれば出品できる" do
        expect(@item).to be_valid
      end
      it "priceが300円以上であれば登録できる" do
        @item.price = "300"
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "titleが空では登録できない" do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "explanationが空では登録できない" do
        @item.explanation = ""
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "categoryが空では登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "statusが空では登録できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "delivery_chargeが空では登録できない" do
        @item.delivery_charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it "shipping_areaが空では登録できない" do
        @item.shipping_area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it "durationが空では登録できない" do
        @item.duration_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Duration can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが299では登録できない" do
        @item.price = "299"
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "priceが10000000では登録できない" do
        @item.price = "100000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "価格が全角では登録できない" do
        @item.price = "100000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "category_idが1では登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "status_idが1では登録できない" do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "delivery_charge_idが1では登録できない" do
        @item.delivery_charge_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
      end
      it "shipping_area_idが1では登録できない" do
        @item.shipping_area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it "duration_idが1では登録できない" do
        @item.duration_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Duration must be other than 1")
      end
      it "priceが空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceは半角英数混合では登録できない" do
        @item.price = "abc123"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters.")
      end
      it "priceは半角英語だけでは登録できない" do
        @item.price = "aaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters.")
      end
    end
  end
end