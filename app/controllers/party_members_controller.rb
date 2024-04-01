class PartyMembersController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_party_member, only: [:destroy]

  def create
    emails = create_params[:emails].map do |email|
      return email.strip
    end

  
    
  end

  def destroy
    @party_member = PartyMember.find_by(id: params[:id])

    return redirect_to user_root_path, alert: 'Party Member not found'  unless @party_member.present?

    redirect_to party_path(@party_member.party), notice: 'Party member removed' if @party_member.destroy
  end

  private

  def create_params
    params.require(:party_member).permit(:emails)
  end

  def delete_params
    params.require(:party_member).permit(:id, :party_id)
  end

  def validate_party_member
    redirect_to user_root_path, alert: 'No party member found' unless PartyMember.find_by(id: params[:id])
  end
end
