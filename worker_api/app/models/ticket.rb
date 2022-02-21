class Ticket < ApplicationRecord
  belongs_to :work_order
  belongs_to :client_branch
  belongs_to :branch_format, ->{ select(:address).includes(:client, :client_manager) }, foreign_key: :client_branch_id, class_name: 'ClientBranch'
end
