class Token < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :value, presence: true

  after_initialize :generate_value

  def to_param
    value
  end

private

  def generate_value
    self.value ||= SecureRandom.urlsafe_base64(16)
  end
end
