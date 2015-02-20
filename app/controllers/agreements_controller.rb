class AgreementsController < ApplicationController

  before_action :ensure_user

  def new
    @agreement_form = AgreementForm.new
  end

  def create
    @agreement_form = AgreementForm.new(objectives_params)
    current_user.agreements.create(
      objective: @agreement_form.objective_as_json
    )

    redirect_to action: :index
  end

  def index
    @agreements = current_user.agreements.all
    # @employees_reports = current_user.employees_reports
  end

private

  def objectives_params
    params.require(:agreement_form).permit(*AgreementForm.allowed_params)
  end

end
