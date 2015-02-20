class AgreementFormFactory

  def initialize(agreement)
    @agreement = agreement
  end

  def agreement
    AgreementForm.new.tap do |form|
      process_agreement(form)
    end
  end

private

  def process_agreement(form)
    form_rows = AgreementForm.allowed_params_in_rows

    @agreement.agreement.each_with_index do |objective, index|
      row = form_rows[index]
      row.each do |field|
        key = field.sub(/_\d+$/, '')
        value = objective[key]
        form.send("#{field}=", value)
      end
    end
  end

end
