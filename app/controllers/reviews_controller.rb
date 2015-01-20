class ReviewsController < ApplicationController
  def edit
    @review_id = params[:id]
    @report = Report.find(params[:report_id])
    @review_form = ReportForm.from_report(@report, 'mid_year_review')
  end

  def update
    report = Report.find(params[:report_id])
    review_form = ReportForm.new(report_params)

    report.update(
        mid_year_review_development: review_form.development_as_json,
        mid_year_review_smart: review_form.smart_as_json
    )

    redirect_to controller: :reports, action: :index
  end

private

  def report_params
    development_params = (1..ReportForm::DEVELOPMENT_OBJECTIVES).map do |n|
      "development_#{n}"
    end
    smart_params = (1..ReportForm::SMART_OBJECTIVES).map do |n|
      ["smart_what_#{n}", "smart_how_#{n}"]
    end.flatten

    params.require(:report_form).permit(*(development_params + smart_params))
  end
end
