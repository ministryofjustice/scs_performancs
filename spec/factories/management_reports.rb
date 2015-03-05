FactoryGirl.define do
  factory :management_report do
    factory :filled_in_report do
      review_period '2015/16'
      development ['Develop as an Agile practitioner'] + [''] * 9
      smart [
        { what: 'Learn Ruby language', how: 'Join a weekly Ruby club' }
      ] + [{ what: '', how: '' }] * 9

      factory :approved_report do
        approved_at { 5.days.ago }

        factory :report_with_mid_year_review do
          mid_year_review_development ['Getting there'] + [''] * 9
          mid_year_review_smart [
            { what: 'I can code bits now', how: 'I attended 3 times' }
          ] + [{ what: '', how: '' }] * 9
          mid_year_review_comment 'All good!'

          factory :report_with_mid_year_approved do
            mid_year_approved_at { 3.days.ago }

            factory :report_with_end_year_review do
              end_year_review_development ['I am Agile practitioner now'] + [''] * 9
              end_year_review_smart [
                { what: 'I can use Rails', how: 'I attended 6 times' }
              ] + [{ what: '', how: '' }] * 9
              end_year_review_comment 'It could not be a better year!'
            end
          end
        end
      end
    end
  end
end
