class Ticket < ApplicationRecord
  belongs_to :work_order, optional: true
  belongs_to :client_branch
end
