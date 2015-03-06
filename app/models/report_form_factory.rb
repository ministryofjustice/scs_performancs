class ReportFormFactory
  def initialize(report)
    @report = report
  end

  def objectives
    ObjectivesForm.new.tap do |form|
      form.review_period = @report.review_period
      process_development(form, '')
      process_smart(form, '')
    end
  end

  def review(type)
    ReviewForm.new.tap do |form|
      column_set = "#{type}_review"

      form.review_period = @report.review_period
      process_development(form, column_set)
      process_smart(form, column_set)
      process_comment(form, column_set)
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

  def process_comment(form, column_set)
    column = "#{column_set}_comment"
    form.comment = @report.send(column)
  end
end
