require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    Faker::Config.locale = 'ja'
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
  end

  describe '商品新規登録' do
    context '商品登録がうまくいくとき' do
      it '「image、title、text、price」が存在し、「category_id、status_id、shipping_id、prefecture_id、day_id」が初期値(0)以外を選択されていれば、登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it 'imageが空では、登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では、登録できない' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'textが空では、登録できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idが初期値(0)のままでは、登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'status_idが初期値(0)のままでは、登録できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Status Select')
      end
      it 'shipping_idが初期値(0)のままでは、登録できない' do
        @item.shipping_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping Select')
      end
      it 'prefecture_idが初期値(0)のままでは、登録できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it 'day_idが初期値(0)のままでは、登録できない' do
        @item.day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Day Select')
      end
      it 'priceが空では、登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字では、登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが300より小さい場合、登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが9999999より大きい場合、登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
    end
  end
end
