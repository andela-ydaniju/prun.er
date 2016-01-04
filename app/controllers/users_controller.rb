class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @links = @user.links.paginate(page: params[:page], per_page: 16)
  end

  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Your registration was successful!"
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
