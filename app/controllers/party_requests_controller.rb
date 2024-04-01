class PartyRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_request, only: [:show, :update]

  def index
    @party_requests = current_user.party_requests
  end

  def show

  end

  def update
    @request.update(request_accept_params)

    if update_params[:accepted] == 'true'
      unless PartyMember.find_by(party_id: @request.party, user: @request.user)
        PartyMember.create(
          party: @request.party,
          user: @request.user
        )
      end
    elsif update_params[:accepted] == 'false'
      pm_to_remove = PartyMember.find_by(party_id: @request.party, user: @request.user)
      pm_to_remove.delete if pm_to_remove
    end

    redirect_to user_root_path, notice: 'Party Request Accepted!'
  end

  def destroy
    @party_request = PartyRequest.find_by(id: params[:id])

    return redirect_to user_root_path, alert: 'Party Request not found'  unless @party_request.present?

    redirect_to party_path(@party_request.party), notice: 'Party Request revoked' if @party_request.destroy
  end

  private

  def update_params
    params.require(:party_request).permit(:accepted, :party_id, :user_id)
  end

  def request_accept_params
    params.require(:party_request).permit(:accepted)
  end

  def validate_request
    @request = PartyRequest.find_by(id: params[:id])
    redirect_to user_root_path, alert: 'No party request found' unless @request.present?
  end

end
