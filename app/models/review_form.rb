class ReviewForm < ObjectivesForm
  attr_accessor :comment

  def self.allowed_params
    super + ['comment']
  end
end
