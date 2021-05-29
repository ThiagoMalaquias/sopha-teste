class ApplicationController < ActionController::Base
  before_action  :authenticate_user!

  def authenticate_user!
    if cookies[:user_sopha_teste].blank?
      redirect_to "/singin"
      return
    end

    user
  end
    
  def user
    return @user if @user.present?
    @user = User.find(JSON.parse(cookies[:user_sopha_teste])["id"])
    return @user
  end
end
