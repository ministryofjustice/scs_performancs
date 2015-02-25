# A Report represents the contents of a SCS paper performance form.
class Report < ActiveRecord::Base

  belongs_to :user

  include IdOrdered
  include ApprovalStages

end
