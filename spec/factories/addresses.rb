FactoryBot.define do
  factory :address do
      post_code     {"123-4567"}
      prefecture_id {2}
      city          {"大阪市都島区"}
      address       {"中野町4-2-20"}
      building_name {"柳ビル103"}
      phone_number  {"09012345678"}
      association :buy
  
    
  end
end
