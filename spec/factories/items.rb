FactoryBot.define do
  factory :item do       
    product_name         {'月のガゾウ'}
    description          {'月のガゾウ'}
    category_id          {2}
    product_condition_id {2}
    cost_id              {2}
    prefecture_id        {2}
    shipping_day_id      {2}
    price                {360}

    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

#association :user → users.rbのFactoryBotとアソシエーションがあることを意味する。
#Itemのインスタンスが生成したと同時に、関連するUserのインスタンスも生成される。
#Itemに対しては、必ずUserが紐付いている必要があるため、このように記述する必要がある。
#(UserはItemを必ず持っているわけではないので、users.rbには記述しない。)

#afterメソッドは任意の処理の後に指定の処理を実行することができます。例えば、after(:build) とすることで、
#インスタンスがbuildされた後に指定の処理を実行できる。
#io: File.openで設定したパスのファイル（public/images/test_image.png）を、
#test_image.pngというファイル名で保存をしている。
