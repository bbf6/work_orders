class WorkOrder < ApplicationRecord
  belongs_to :thecnician
  has_one :retainer
  has_one :ticket

  enum status: {
    pending: 1,
    doing: 2,
    paused: 3,
    done: 4,
    canceled: 5
  }
end
