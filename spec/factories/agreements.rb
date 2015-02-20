FactoryGirl.define do
  factory :agreement do
    factory :filled_in_agreement do
      agreement [
        { type: '', what: 'Learn Ruby language', how: 'Join a weekly Ruby club', deliverable: '', measurement: '' }
      ] + [{ type: '', what: '', how: '', deliverable: '', measurement: '' }] * 9

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
