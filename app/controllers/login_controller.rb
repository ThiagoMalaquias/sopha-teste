class LoginController < ApplicationController
  skip_before_action :authenticate_user!, :verify_authenticity_token
  layout 'login'

  def sign_in #entrar
    if params[:user].present?
      user = User.where(email: params[:user][:email], password: params[:user][:password])
      if user.count > 0
        @user = user.first
        save_cookies

        redirect_to "/"
      else
        flash[:error] = "Email ou Senha inválidos"
        redirect_to "/singin"
      end
    end
  end

  def new
  end

  def sign_up #cadastre-se
    @user = User.new(user_params)
    
    if @user.save
      save_cookies
      redirect_to "/"
    else
      flash[:error] = @user.errors
      redirect_to "/signup"
    end
  end

  def exit
    cookies[:user_sopha_teste] = nil
    redirect_to "/singin"
  end

  private
    def save_cookies
      time = params[:user][:rememberme] == "1" ? 1.year.from_now : 30.minutes.from_now
      value = {
        id: @user.id,
        nome: @user.username,
        email: @user.email
      }
      cookies[:user_sopha_teste] = { value: value.to_json, expires: time, httponly: true }
    end

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end