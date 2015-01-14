FactoryGirl.define do
  factory :report do
    factory :filled_in_report do
      development [ 'Develop as an Agile practitioner' ] + [] * 9
    end
  end
end