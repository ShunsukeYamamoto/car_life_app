class UsersController < ApplicationController
  before_action :move_to_user_sign_in

  def index
    @user = current_user
  end

  private

  def move_to_user_sign_in
    redirect_to user_session_path unless user_signed_in?
  end
end
