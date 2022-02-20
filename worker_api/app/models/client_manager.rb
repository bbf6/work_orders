class ClientManager < ApplicationRecord
  has_many :client_manager_phones
  has_one :client_branch
end
