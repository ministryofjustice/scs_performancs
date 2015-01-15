class ReportForm
  DEVELOPMENT_OBJECTIVES = 10

  include ActiveModel::Model

  (1..DEVELOPMENT_OBJECTIVES).each do |n|
    attr_accessor "development_#{n}"
  end

  def development_as_json
    (1..DEVELOPMENT_OBJECTIVES).map { |n| send("development_#{n}") || '' }
  end

  def self.from_report(report)
    report_form = ReportForm.new

    report.development.each_with_index do |d, index|
      report_form.send("development_#{index + 1}=", d)
    end

    report_form
  end
end
