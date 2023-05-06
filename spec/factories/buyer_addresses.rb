FactoryBot.define do
  factory :buyer_address do
    token {"tok_abcdefghijk00000000000000000"}    
    post_cord         {"123-4567"}
    prefecture_id     {2}
    city              {'横浜市緑区'}
    address           {'青山1-1-1'}
    building_name     {'柳ビル'}
    phone_number      {'09012345678'}    
  end

  
end
