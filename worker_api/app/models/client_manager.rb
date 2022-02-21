class ClientManager < ApplicationRecord
  has_many :client_manager_phones
  has_one :client_branch

  accepts_nested_attributes_for :client_manager_phones
end
