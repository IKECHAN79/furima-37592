require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
describe '商品購入' do
  before do
   user = FactoryBot.create(:user)
   item = FactoryBot.create(:item)
   @buy_address = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id )

  end

context '商品購入ができる場合' do
  it 'building_name以外すべての項目が存在していれば購入できる' do
    expect(@buy_address).to be_valid
  end
end

context '商品購入ができない場合' do
  it 'post_codeが空では購入できない' do
   @buy_address.post_code = ''
   @buy_address.valid?
   expect(@buy_address.errors.full_messages).to include("Post code can't be blank")
  end

  it 'post_codeは「3桁ハイフン4桁」の半角文字列保存以外では購入できない' do
   @buy_address.post_code = '1234567'
   @buy_address.valid?
   expect(@buy_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
  end


  it '都道府県に「---」が選択されている場合では購入できない' do
   @buy_address.prefecture_id = 1
   @buy_address.valid?
   expect(@buy_address.errors.full_messages).to include("Prefecture can't be blank")
  end

  it 'cityが空では購入できない' do
   @buy_address.city = ''
   @buy_address.valid?
   expect(@buy_address.errors.full_messages).to include("City can't be blank")
  end

  it 'addressが空では購入できない' do
   @buy_address.address = ''
   @buy_address.valid?
   expect(@buy_address.errors.full_messages).to include("Address can't be blank")
  end

  it 'phone_numberが空では購入できない' do
    @buy_address.phone_number = ''
    @buy_address.valid?
    expect(@buy_address.errors.full_messages).to include("Phone number can't be blank")
  end

  it 'phone_numberは10桁以上11桁以内の半角数値保存以外では購入できない' do
    @buy_address.phone_number = '090123456'
    @buy_address.valid?
    expect(@buy_address.errors.full_messages).to include("Phone number is invalid")
  end

  it "tokenが空では購入できないこと" do
    @buy_address.token = nil
    @buy_address.valid?
    expect(@buy_address.errors.full_messages).to include("Token can't be blank")
  end
 end
end
end
