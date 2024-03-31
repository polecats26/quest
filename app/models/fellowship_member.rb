class FellowshipMember < ApplicationRecord
  belongs_to :user
  belongs_to :fellowship
end
