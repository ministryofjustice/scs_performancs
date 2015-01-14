class ReportsController < ApplicationController
  def new
    @report_form = ReportForm.new
  end

  def create
    @report_form = ReportForm.new(report_params)
    Report.create(development: @report_form.development_as_json)

    redirect_to action: :index
  end

  def index
    @reports = Report.all
  end

  def edit
    @report = Report.find(params[:id])
    @report_form = ReportForm::from_report(@report)
  end

  def update
    @report_form = ReportForm.new(report_params)
    report = Report.find(params[:id])
    report.update(development: @report_form.development_as_json)

    redirect_to action: :index
  end

  def report_params
    development_params = (1..ReportForm::DEVELOPMENT_OBJECTIVES).map { |n| :"development_#{n}" }

    params.require(:report_form).permit(*development_params)
  end
end