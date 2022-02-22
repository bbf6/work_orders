class WorkOrder < ApplicationRecord
  belongs_to :thecnician
  has_one :retainer
  has_one :ticket

  scope :by_thecnician, ->(id) { relations.where(thecnician_id: id).working_plan_order }
  scope :working_plan_order, -> { order('tickets.accident_date desc, retainers.service_date desc') }
  scope :pending_works, -> { relations.where(status: 'pending').working_plan_order }
  scope :done_works, -> { relations.where(status: 'done').working_plan_order }

  scope :relations, -> do
    select(:id, :status, :begining_attention_date, :ending_attention_date, :thecnician_id)
    .includes(ticket: { client_branch: :client_manager }, retainer: { client_branch: :client_manager })
    .includes(ticket: { client_branch: :client }, retainer: { client_branch: :client })
  end

  enum status: {
    pending: 1,
    doing: 2,
    paused: 3,
    done: 4,
    canceled: 5
  }
end
