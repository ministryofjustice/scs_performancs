class ReportFormFactory
  def initialize(report)
    @report = report
  end

  def objectives
    ObjectivesForm.new.tap do |form|
      process_development(form, '')
      process_smart(form, '')
    end
  end

  def review(type)
    ReviewForm.new.tap do |form|
      process_development(form, "#{type}_review")
      process_smart(form, "#{type}_review")
    end
  end

private

  def process_smart(form, column_set)
    column = column_set.empty? ? 'smart' : "#{column_set}_smart"
    @report.send(column).each_with_index do |s, index|
      form.send("smart_what_#{index + 1}=", s['what'])
      form.send("smart_how_#{index + 1}=", s['how'])
    end
  end

  def process_development(form, column_set)
    column = column_set.empty? ? 'development' : "#{column_set}_development"
    @report.send(column).each_with_index do |d, index|
      form.send("development_#{index + 1}=", d)
    end
  end
end
