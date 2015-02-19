module IdOrdered
  extend ActiveSupport::Concern

  included do
    default_scope { order(:id) }
  end

end
