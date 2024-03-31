class FellowshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_fellowship, only: [:show]

  def index
    @fellowships = current_user.fellowships
  end

  def show

  end

  def new
      @fellowship = Fellowship.new
  end

  def create
      @fellowship = Fellowship.new(create_params)

      return redirect_to @fellowship if @fellowship.save

      render :new, alert: 'A problem has occurred'
  end

  private

  def create_params
    params.require(:fellowship).permit(:title, :description, :user_id)
  end

  def validate_fellowship
    @fellowship = Fellowship.find_by(id: params[:id])
    redirect_to user_root_path, alert: 'Fellowship not found' unless @fellowship.present?
  end 
end
