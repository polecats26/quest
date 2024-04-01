class PartiesController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_party, only: [:show]

  def index
    member_of_parties = PartyMember.where(user: current_user)
    @parties = member_of_parties.map(&:party).concat(current_user.parties).uniq
  end

  def show

  end

  def new
      @party = Party.new
  end

  def create
      @party = Party.new(create_params)

      return redirect_to @party if @party.save

      render :new, alert: 'A problem has occurred'
  end

  private

  def create_params
    params.require(:party).permit(:title, :description, :user_id)
  end

  def validate_party
    @party = Party.find_by(id: params[:id])

    redirect_to user_root_path, alert: 'No party over here' unless @party.present?
  end 
end
