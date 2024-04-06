class QuestsController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_quest

  def new
    @quest = Quest.new
    @parties = current_user.parties
  end

  def show

  end

  def create
    @quest = Quest.new(create_params)

    return redirect_to @quest if @quest.save

    render :new, alert: 'A problem has occurred'
  end

  private

  def create_params
    params.require(:quest).permit(:title, :description, :user_id, :party_id, :completion_date)
  end

  def validate_quest
    @quest = Quest.find_by(id: params[:id])
    redirect_to user_root_path, alert: 'No quest found' unless @quest.present?
  end
end
