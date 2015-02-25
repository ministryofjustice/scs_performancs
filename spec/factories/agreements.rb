FactoryGirl.define do
  factory :agreement do
    factory :filled_in_agreement do
      agreement [
        { type: '', what: 'Learn Ruby language', how: 'Join a weekly Ruby club', deliverable: '', measurement: '' }
      ] + [{ type: '', what: '', how: '', deliverable: '', measurement: '' }] * 9

      factory :approved_agreement do
        approved_at { 5.days.ago }

        factory :agreement_with_mid_year_review do
          mid_year_review_comment 'Tests all green.'

          factory :agreement_with_mid_year_approved do
            mid_year_approved_at { 3.days.ago }

            factory :agreement_with_end_year_review do
            end
          end
        end
      end
    end
  end
end
