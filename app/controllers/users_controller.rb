class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      flash[:success] = "Добро пожаловать, #{@user.contact_name}!"
      redirect_to home_path
    else 
      flash[:warning] = @user.errors.full_messages.to_sentence
      redirect_to '/users/new'
    end
  end

  def destroy
  end

  def profile_page
    @user = User.find(session[:user_id])
  end

  def secret
  end

  private

  def user_params
    params.permit(:email, :contact_name, :password, :password_confirmation)
  end
end
