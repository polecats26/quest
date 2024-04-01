class QuestboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user = current_user
    joined_parties = Party.joins(:party_requests).where(party_requests: { user_id: current_user.id, accepted: true })
    @parties = current_user.parties.merge(joined_parties) || []

    @party_requests = current_user.party_requests.where(accepted: nil)
  end
end
