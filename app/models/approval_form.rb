class ApprovalForm < ObjectivesForm

  attr_accessor :comment
  attr_accessor :final_rating

  def self.allowed_params
    ['comment', 'final_rating']
  end
end
