class ReportsController < ApplicationController
  def new
    @report_form = ReportForm.new
  end

  def create
    @report_form = ReportForm.new(report_params)
    Report.create(
        development: @report_form.development_as_json,
        smart: @report_form.smart_as_json
    )

    redirect_to action: :index
  end

  def index
    @reports = Report.all
  end

  def edit
    @report = Report.find(params[:id])
    @report_form = ReportForm.from_report(@report)
  end

  def update
    @report_form = ReportForm.new(report_params)
    report = Report.find(params[:id])
    report.update(
        development: @report_form.development_as_json,
        smart: @report_form.smart_as_json
    )

    redirect_to action: :index
  end

  def approve
    @report = Report.find(params[:id])
    @report.update(approved_at: Time.now) unless @report.approved?

    redirect_to action: :index
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
