class ReportForm
  DEVELOPMENT_OBJECTIVES = 10

  include ActiveModel::Model

  (1..DEVELOPMENT_OBJECTIVES).each do |n|
    attr_accessor "development_#{n}"
  end

  def development_as_json
    (1..DEVELOPMENT_OBJECTIVES).map { |n| send("development_#{n}") || '' }
  end

  def persisted?
    false
  end
end