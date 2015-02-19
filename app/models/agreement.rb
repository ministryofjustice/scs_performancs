# An Agreement represents the contents of the paper form titled
# "SCS Performance Agreement Form".
class Agreement < ActiveRecord::Base

  belongs_to :user

  include IdOrdered

end
