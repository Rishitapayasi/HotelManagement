FactoryBot.define do 
  factory :user do 
    full_name {'sita'}
    email { sita@example.com }
    password {'sita'}

    # association :hotel, factory: :hotel
  end
end 