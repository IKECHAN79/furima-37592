FactoryBot.define do
  factory :buy_address do
    post_code     {"123-4567"}
    prefecture_id {2}
    city          {"大阪市都島区"}
    address       {"中野町4-2-20"}
    phone_number  {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end