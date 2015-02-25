class AgreementForm
  OBJECTIVES_MAX = 10

  include ActiveModel::Model

  def self.allowed_params
    (1..OBJECTIVES_MAX).map do |n|
      %w[type what how deliverable measurement].map do |field|
        "#{field}_#{n}"
      end
    end.flatten
  end

  def self.allowed_params_in_rows
    allowed_params.in_groups_of(5)
  end

  AgreementForm.allowed_params_in_rows.each do |row|
    row.each do |field|
      attr_accessor field
    end
  end

  def agreement_as_json
    AgreementForm.allowed_params_in_rows.map do |row|
      row.each_with_object({}) do |field, hash|
        key = field[/(.+)_\d+/, 1].to_sym
        value = send(field)
        hash[key] = value
      end
    end
  end

end
