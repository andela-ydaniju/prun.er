class UsersController < ApplicationController
  def new
    @user = User.new
    redirect_to dashboard_path if signed_in?
  end

  def show
    redirect_to root_path unless current_user
    @user = User.find(params[:id])
    @links = @user.links.paginate(page: params[:page], per_page: 12)
  end

  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Your registration was successful!"
      sign_in(@user)
      redirect_to @user
    else
      render "signup"
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password,
      :password_confirmation
    )
  end
end
