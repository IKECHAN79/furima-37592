FactoryBot.define do
  factory :item do
    item_name                {"くまのぬいぐるみ"}
    item_more                {"茶色で可愛いです"}
    category_id                 {2}
    condition_id                {2}
    delivery_charge_id          {2}
    prefecture_id               {2}
    days_to_ship_id             {2}
    price                    {"500"}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/kuma.jpeg'), filename: 'kuma.jpeg')
    end
    
  end
end
