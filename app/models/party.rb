class Party < ApplicationRecord
  has_many :party_members
  has_many :party_requests
  belongs_to :user

  def member_count
    party_members.count + 1 # + user
  end

end
