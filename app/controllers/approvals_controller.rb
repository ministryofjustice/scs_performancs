class ApprovalsController < ApplicationController
  before_action :ensure_user

  def edit
    @approval_id = params[:id].to_sym
    @report = Report.find(params[:report_id])
    if @report.user.manager == current_user
      @approval_form = ApprovalForm.new
    else
      forbidden
    end
  end

  def update
    approval_id = params[:id].to_sym
    @report = Report.find(params[:report_id])
    @approval_form = ApprovalForm.new(approval_params)

    @report.approve!(approval_id, @approval_form.comment)

    redirect_to controller: :reports, action: :index
  end

private

  def approval_params
    params.require(:approval_form).permit(*ApprovalForm.allowed_params)
  end
end
