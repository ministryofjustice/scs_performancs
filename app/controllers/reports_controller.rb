class ReportsController < ApplicationController
  def new
    @report_form = ObjectivesForm.new
  end

  def create
    @report_form = ObjectivesForm.new(objectives_params)
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
    @report_form = ReportFormFactory.new(@report).objectives
  end

  def update
    @report_form = ObjectivesForm.new(objectives_params)
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

  def objectives_params
    params.require(:objectives_form).permit(*ObjectivesForm.allowed_params)
  end
end
