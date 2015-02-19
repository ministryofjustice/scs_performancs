class AgreementsController < ApplicationController
  before_action :ensure_user

  def new
    @agreement_form = AgreementForm.new
  end

end
