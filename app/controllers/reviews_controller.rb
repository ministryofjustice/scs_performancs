class ReviewsController < ApplicationController
  before_action :ensure_user

  def edit
    @review_id = params[:id].to_sym
    @report = Report.find(params[:report_id])
    employee_only(@report) do
      @review_form = ReportFormFactory.new(@report).review(@review_id)
    end
  end

  def update
    report = Report.find(params[:report_id])
    employee_only(report) do
      review_form = ReviewForm.new(review_params)
      update_report(report, review_form)

      redirect_to controller: :reports, action: :index
    end
  end

private

  def update_report(report, review_form)
    report.update(
        "#{params[:id]}_review_development" => review_form.development_as_json,
        "#{params[:id]}_review_smart" => review_form.smart_as_json,
        "#{params[:id]}_review_comment" => review_form.comment
    )
  end

  def review_params
    params.require(:review_form).permit(*ReviewForm.allowed_params)
  end
end
