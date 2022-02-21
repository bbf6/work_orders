class Thecnician < ApplicationRecord
  has_many :thecnician_phones
  has_many :work_orders

  accepts_nested_attributes_for :thecnician_phones
  default_scope -> do
    includes(:thecnician_phones)
    .select(:id, :name, :last_name, :mother_last_name, :birth_date, :sex, :email)
    .where(status: true)
  end
end
