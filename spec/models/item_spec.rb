require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

describe '商品出品' do
  context '商品出品ができる場合' do
    it 'すべての項目が存在していれば保存できる' do
      expect(@item).to be_valid
    end
  end

  context '商品出品ができない場合' do
    it 'item_nameが空では保存できない' do
      @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")

    end
    it 'item_moreが空では保存できない' do
      @item.item_more = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item more can't be blank")


    end
    it 'category_idが空では保存できない' do
      @item.category_id = ''
       @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
        

    end
    it 'condition_idが空では保存できない' do
      @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")

    end
    it 'delivery_charge_idが空では保存できない' do
      @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      

    end
    it 'prefecture_idが空では保存できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")

    end
    it 'days_to_ship_idが空では保存できない' do
      @item.days_to_ship_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship can't be blank")

    end
    it 'priceが空では保存できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")

    end
    it 'userが紐付いていないと保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
    it 'imageが空では保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'カテゴリーに「---」が選択されている場合は出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it '商品の状態に「---」が選択されている場合は出品できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it '配送料の負担に「---」が選択されている場合は出品できない' do
      @item.delivery_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
    end
    it '発送元の地域に「---」が選択されている場合は出品できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it '発送日までの日数に「---」が選択されている場合は出品できない' do
      @item.days_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
    end
    it '価格に半角数字以外が含まれている場合は出品できない' do
      @item.price = '１００００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
      it '価格が300円未満では出品できない' do
      @item.price = '100'
      @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it '価格が9_999_999円を超えると出品できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
  end
end
end