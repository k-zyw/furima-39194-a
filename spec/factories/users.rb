FactoryBot.define do
  factory :user do
    #一意制約(今回は、emailが該当)じゃなければFakerがなくてもいい    
    email {Faker::Internet.free_email}
    password {'aaa111'}    
    password_confirmation {password}
    nick_name       {Faker::Name.initials}      
    last_name       {'やマ田'}
    first_name      {'太ろウ' }
    last_name_kana  {'ヤマダ'}
    first_name_kana {'タロウ'}
    birth_day       {Faker::Date.between(from: '1960-01-01', to: '2003-12-31')}
  end
end

