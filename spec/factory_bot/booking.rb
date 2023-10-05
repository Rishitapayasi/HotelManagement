FactoryBot.define do 
  factory :booking do 
    check_in_date {Date.now}
    check_out_date(Date.now)
  end
end