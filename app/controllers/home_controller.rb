class HomeController < ApplicationController
  before_action :user_redirect

  def index; end

  private

  def user_redirect
    redirect_to questboard_index_path if current_user.present?
  end
end
