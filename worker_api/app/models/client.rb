class Client < ApplicationRecord
  has_many :client_branches

  def managers
    self.client_branches.map { |b| b.client_manager }
  end

end
