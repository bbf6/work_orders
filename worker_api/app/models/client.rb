class Client < ApplicationRecord
  has_many :client_branches
  default_scope -> { where(status: true) }
  accepts_nested_attributes_for :client_branches
  scope :with_branches, -> { includes(client_branches: { client_manager: :client_manager_phones }) }
end
