class LogoutController < ApplicationController
  def index
      sign_out current_user if current_user.present?
      redirect_to root_path
  end
end
