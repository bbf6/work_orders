class Client < ApplicationRecord
  has_many :client_branches

  accepts_nested_attributes_for :client_branches
end
