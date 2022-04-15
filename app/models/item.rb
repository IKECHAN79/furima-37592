class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :item_name,          presence: true
  validates :item_more,          presence: true  
  validates :category_id,        presence: true 
  validates :condition_id,       presence: true 
  validates :delivery_charge_id, presence: true
  validates :prefecture_id,      presence: true 
  validates :days_to_ship_id,    presence: true 
  validates :price,              presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
  format: { with: /\A[0-9]+\z/ }
  validates :image,              presence: true
  
  
  belongs_to :category
  belongs_to :Condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
  has_one_attached :image
  belongs_to :user
  has_one    :buy
end
