class ReportForm
  DEVELOPMENT_OBJECTIVES = 10
  SMART_OBJECTIVES = 10

  include ActiveModel::Model

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

  def self.from_report(report, column_set = '')
    ReportForm.new.tap do |report_form|
      process_development(report, report_form, column_set)
      process_smart(report, report_form, column_set)
    end
  end

  def self.process_smart(report, report_form, column_set)
    column = column_set.empty? ? 'smart' : "#{column_set}_smart"
    report.send(column).each_with_index do |s, index|
      report_form.send("smart_what_#{index + 1}=", s['what'])
      report_form.send("smart_how_#{index + 1}=", s['how'])
    end
  end

  def self.process_development(report, report_form, column_set)
    column = column_set.empty? ? 'development' : "#{column_set}_development"
    report.send(column).each_with_index do |d, index|
      report_form.send("development_#{index + 1}=", d)
    end
  end
end
