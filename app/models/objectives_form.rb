class ObjectivesForm
  DEVELOPMENT_OBJECTIVES = 10
  SMART_OBJECTIVES = 10

  include ActiveModel::Model

  attr_accessor :review_period

  (1..DEVELOPMENT_OBJECTIVES).each do |n|
    attr_accessor "development_#{n}"
  end

  (1..SMART_OBJECTIVES).each do |n|
    attr_accessor "smart_what_#{n}"
    attr_accessor "smart_how_#{n}"
  end

  def development_as_json
    (1..DEVELOPMENT_OBJECTIVES).map { |n| send("development_#{n}") || '' }
  end

  def smart_as_json
    (1..SMART_OBJECTIVES).map do |n|
      {
        what: send("smart_what_#{n}") || '',
        how: send("smart_how_#{n}") || ''
      }
    end
  end

  def self.allowed_params
    params = ['review_period']

    (1..ObjectivesForm::DEVELOPMENT_OBJECTIVES).each do |n|
      params << "development_#{n}"
    end
    (1..ObjectivesForm::SMART_OBJECTIVES).map do |n|
      params << "smart_what_#{n}"
      params << "smart_how_#{n}"
    end

    params
  end
end
