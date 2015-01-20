class ReviewsController < ApplicationController
  def edit
    @review_id = params[:id]
    @report = Report.find(params[:report_id])
    @review_form = ReportFormFactory.new(@report).review(:mid_year)
  end

  def update
    report = Report.find(params[:report_id])
    review_form = ObjectivesForm.new(report_params)

    report.update(
        mid_year_review_development: review_form.development_as_json,
        mid_year_review_smart: review_form.smart_as_json
    )

    redirect_to controller: :reports, action: :index
  end

private

  def report_params
    development_params = (1..ObjectivesForm::DEVELOPMENT_OBJECTIVES).map do |n|
      "development_#{n}"
    end
    smart_params = (1..ObjectivesForm::SMART_OBJECTIVES).map do |n|
      ["smart_what_#{n}", "smart_how_#{n}"]
    end.flatten

    params.require(:review_form).permit(*(development_params + smart_params))
  end
end
