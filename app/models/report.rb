class Report < ActiveRecord::Base

  default_scope { order(:id) }

  def approved?
    !self.approved_at.nil?
  end
end
