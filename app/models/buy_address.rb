class BuyAddress
  include ActiveModel::Model
  #extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :buy_id, :user_id, :item_id, :token

  validates :post_code,        presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id,    presence: true, numericality: {other_than: 1, message: "can't be blank"}
  validates :city,             presence: true
  validates :address,          presence: true
  validates :phone_number,     presence: true, format: {with: /\A\d{10,11}\z/ }
  validates :token, presence: true

  #belongs_to :prefecture
  def save
    # 寄付情報を保存し、変数donationに代入する
    buy = Buy.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end