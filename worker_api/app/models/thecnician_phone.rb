class ThecnicianPhone < ApplicationRecord
  belongs_to :thecnician
  default_scope ->{select(:id, :thecnician_id, :description, :number).where(status: true) }
end
