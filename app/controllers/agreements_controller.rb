class AgreementsController < ApplicationController

  before_action :ensure_user

  def new
    @agreement_form = AgreementForm.new
  end

  def create
    @agreement_form = AgreementForm.new(objectives_params)
    current_user.agreements.create(
      agreement: @agreement_form.agreement_as_json
    )

    redirect_to action: :index
  end

  def index
    @agreements = current_user.agreements.all
    # @employees_agreements = current_user.employees_agreements
  end

  def edit
    @agreement = Agreement.find(params[:id])
    employee_only(@agreement) do
      @agreement_form = AgreementFormFactory.new(@agreement).agreement
    end
  end

  def update
    @agreement_form = AgreementForm.new(objectives_params)
    agreement = Agreement.find(params[:id])
    employee_only(agreement) do
      update_agreement(agreement, @agreement_form)

      redirect_to action: :index
    end
  end

private

  def objectives_params
    params.require(:agreement_form).permit(*AgreementForm.allowed_params)
  end

  def update_agreement(agreement, agreement_form)
    agreement.update agreement: agreement_form.agreement_as_json
  end
end
