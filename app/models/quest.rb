class Quest < ApplicationRecord
  has_one :party # referenced on spawn
  has_many :quest_members

  def active_members
    quest_members.where(active: true)
  end
end
