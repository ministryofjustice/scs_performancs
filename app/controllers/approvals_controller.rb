class ApprovalsController < ApplicationController
  before_action :ensure_user

  def edit
    @approval_id = params[:id].to_sym
    @report = Report.find(params[:report_id])
    manager_only(@report) do
      @approval_form = ApprovalForm.new
    end
  end

  def update
    report = Report.find(params[:report_id])
    manager_only(report) do
      approval_form = ApprovalForm.new(approval_params)
      report.approve!(params[:id].to_sym, approval_form.comment, approval_form.final_rating)

      redirect_to controller: :reports, action: :index
    end
  end

private

  def approval_params
    params.require(:approval_form).permit(*ApprovalForm.allowed_params)
  end
end
