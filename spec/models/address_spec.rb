require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

describe '商品購入' do
  context '商品購入ができる場合' do
  it 'すべての項目が存在していれば保存できる' do
    expect(@address).to be_valid
  end
end

 context '商品購入ができない場合' do
  it 'post_codeが空では保存できない' do
  @address.post_code = ''
  @address.valid?
  expect(@address.errors.full_messages).to include(" ")

  end

  it '都道府県に「---」が選択されている場合では空では購入できない' do
  @address.prefecture_id = １
  @address.valid?
  expect(@address.errors.full_messages).to include(" ")
  end

 end
end
end
