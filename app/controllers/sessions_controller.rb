class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    unless user
      flash[:warning] = 'Неверный адрес эл. почты или пароль.'
      redirect_to '/sessions/new'
      return
    end
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Добро пожаловать, #{user.contact_name}!"
      redirect_to home_path
    else
      flash[:warning] = 'Неверный адрес эл. почты или пароль.'
      redirect_to '/sessions/new'
    end
  end

  def destroy
    reset_session
    flash[:success] = 'Выход успешно завершен.'
    redirect_to home_path
  end
end
