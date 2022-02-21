class WorkOrder < ApplicationRecord
  belongs_to :thecnician
  has_one :retainer
  has_one :ticket

  has_one :retainer_format, ->{ joins(client_branch: :client).joins(client_branch: :client_manager).pluck(:service_date, 'clients.name', :address) }, foreign_key: :work_order_id, class_name: 'Retainer'
  has_one :ticket_format, ->{ joins(client_branch: :client).joins(client_branch: :client_manager).pluck(:accident_date, :details, 'clients.name', :address) }, foreign_key: :work_order_id, class_name: 'Ticket'

  default_scope -> { where(status: true) }
  scope :by_thecnician, ->(id) do
    select(:id, :status, :begining_attention_date, :ending_attention_date, :thecnician_id)
    .includes(:ticket_format, :retainer_format)
    .where(thecnician_id: id)
    .working_plan_order
  end

  scope :working_plan_order, -> { order('tickets.accident_date desc, retainers.service_date desc') }

  enum status: {
    pending: 1,
    doing: 2,
    paused: 3,
    done: 4,
    canceled: 5
  }
end
