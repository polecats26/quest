class QuestboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user = current_user
    @fellowships = current_user.fellowships || []
  end
end
