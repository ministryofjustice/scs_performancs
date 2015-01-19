FactoryGirl.define do
  factory :report do
    factory :filled_in_report do
      development ['Develop as an Agile practitioner'] + [''] * 9
      smart [
        { what: 'Learn Ruby language', how: 'Join a weekly Ruby club' }
      ] + [{ what: '', how: '' }] * 9

      factory :approved_report do
        approved_at { 1.day.ago }

        factory :report_with_mid_year_review do
          mid_year_review_development ['Getting there'] + [''] * 9
          mid_year_review_smart [
            { what: 'I can code bits now', how: 'I attended 3 times' }
          ] + [{ what: '', how: '' }] * 9
        end
      end
    end
  end
end
