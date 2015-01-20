class ReviewsController < ApplicationController
  def edit
    @review_id = params[:id]
    @report = Report.find(params[:report_id])
    @review_form = ReportFormFactory.new(@report).review(:mid_year)
  end

  def update
    report = Report.find(params[:report_id])
    review_form = ReviewForm.new(review_params)

    report.update(
        mid_year_review_development: review_form.development_as_json,
        mid_year_review_smart: review_form.smart_as_json,
        mid_year_review_comment: review_form.comment
    )

    redirect_to controller: :reports, action: :index
  end

private

  def review_params
    params.require(:review_form).permit(*ReviewForm.allowed_params)
  end
end
