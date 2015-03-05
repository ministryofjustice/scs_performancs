class ReportsController < ApplicationController

  before_action :ensure_user

  def new
    @report_form = ObjectivesForm.new
  end

  def create
    report_form = ObjectivesForm.new(objectives_params)
    current_user.reports.create(
        review_period: report_form.review_period,
        development: report_form.development_as_json,
        smart: report_form.smart_as_json
    )

    redirect_to action: :index
  end

  def index
    @reports = current_user.reports.all
    @employees_reports = current_user.employees_reports
  end

  def edit
    @report = ManagementReport.find(params[:id])
    employee_only(@report) do
      @report_form = ReportFormFactory.new(@report).objectives
    end
  end

  def update
    @report_form = ObjectivesForm.new(objectives_params)
    report = ManagementReport.find(params[:id])
    employee_only(report) do
      update_report(report, @report_form)

      redirect_to action: :index
    end
  end

private

  def objectives_params
    params.require(:objectives_form).permit(*ObjectivesForm.allowed_params)
  end

  def update_report(report, report_form)
    report.update(
        review_period: report_form.review_period,
        development: report_form.development_as_json,
        smart: report_form.smart_as_json
    )
  end
end
