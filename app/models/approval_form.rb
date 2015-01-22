class ApprovalForm < ObjectivesForm
  attr_accessor :comment

  def self.allowed_params
    ['comment']
  end
end
