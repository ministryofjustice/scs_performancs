class Report < ActiveRecord::Base
  default_scope { order(:id) }

  def approved?
    !approved_at.nil?
  end
end
