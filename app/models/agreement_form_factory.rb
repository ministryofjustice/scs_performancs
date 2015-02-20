class AgreementFormFactory

  def initialize(agreement)
    @agreement = agreement
  end

  def objectives
    AgreementForm.new.tap do |form|
      process_objective(form)
    end
  end

private

  def process_objective(form)
    form_rows = AgreementForm.allow_params_in_rows

    @agreement.objective.each_with_index do |objective, index|
      row = form_rows[index]
      row.each do |field|
        key = field.sub(/_\d+$/, '')
        value = objective[key]
        form.send("#{field}=", value)
      end
    end
  end

end
