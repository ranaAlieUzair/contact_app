class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      session[:user_id] = user.id
      redirect_to login_path, notice: "successfully Created User!"
    else
      flash[:alert] = "invalid email or password!"
      redirect_to signup_path, alert: "invalid email or password!"
    end
  end
end
