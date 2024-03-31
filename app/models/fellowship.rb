class Fellowship < ApplicationRecord
  has_many :fellowship_members

  def members
    fellowship_members.where(active: true)
  end
end
