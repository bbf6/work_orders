class Thecnician < ApplicationRecord
  has_many :thecnician_phones
  has_many :phones, foreign_key: 'thecnician_phones_id', class_name: 'ThecnicianPhone'
  has_many :work_orders
end
