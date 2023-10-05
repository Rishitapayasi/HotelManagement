FactoryBot.define do 
  factory :hotel do 
    name {'snow'}
    location {'indore'}
    status {'open'}

    # association :user, factory: :user
  end
end