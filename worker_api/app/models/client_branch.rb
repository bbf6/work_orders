class ClientBranch < ApplicationRecord
  belongs_to :client
  belongs_to :client_manager
  has_many :retainers
  has_many :tickets

  accepts_nested_attributes_for :client_manager
end
