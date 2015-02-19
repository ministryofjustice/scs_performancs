FactoryGirl.define do
  factory :agreement do
    factory :filled_in_agreement do

      factory :approved_agreement do

        factory :agreement_with_mid_year_review do

          factory :agreement_with_mid_year_approved do

            factory :agreement_with_end_year_review do
            end
          end
        end
      end
    end
  end
end
