class AgreementForm
  OBJECTIVES_MAX = 10

  include ActiveModel::Model

  def self.allowed_params
    (1..OBJECTIVES_MAX).map do |n|
      %w[type what how deliverable measurement].map do |field|
        "objective_#{field}_#{n}"
      end
    end.flatten
  end

  AgreementForm.allowed_params.in_groups_of(5).each do |row|
    row.each do |field|
      attr_accessor field
    end
  end

  def objective_as_json
    AgreementForm.allowed_params.in_groups_of(5).map do |row|
      row.each_with_object({}) do |field, hash|
        key = field[/objective_(.+)_\d+/, 1].to_sym
        value = send(field)
        hash[key] = value
      end
    end
  end

end
