class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  
  def index
  end

  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks
    unless current_user.id == @user.id
      redirect_to root_url
    end
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザーを登録しました。'
    redirect_to @user
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました。'
      render 'tasks/index'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
