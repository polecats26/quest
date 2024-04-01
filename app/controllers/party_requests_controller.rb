class PartyRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_request, only: [:show, :update]
  
  def index
    @requests = current_user.party_requests
  end

  def show

  end

  def edit
    debugger
  end

  def update
    @request.update(update_params)

    redirect_to user_root_path, notice: 'Party Request Accepted!'
  end


  private

  def update_params
    params.require(:party_request).permit(:accepted)
  end

  def validate_request
    @request = PartyRequest.find_by(id: params[:id])
    redirect_to user_root_path, alert: 'No party request found' unless @request.present?
  end

end
