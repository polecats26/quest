class Party < ApplicationRecord
  has_many :party_members
  has_many :party_requests
  belongs_to :user

  def people
    party_members.where(active: true)
  end
end
