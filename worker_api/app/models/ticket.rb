class Ticket < ApplicationRecord
  belongs_to :work_order
  belongs_to :client_branch
end
