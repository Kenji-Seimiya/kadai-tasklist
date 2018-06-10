class TasksController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  
  def index
    @task = current_user.tasks.build #form_for用
    @tasks = current_user.tasks.all #task一覧
  end
  
  def show
    
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.new(task_params)
    
    if @task.save
      flash[:success] = '登録されました'
      redirect_to root_url
    else
      flash.now[:danger] = '登録されませんでした'
      @tasks = current_user.tasks.all
      render 'toppages/index'
    end
  end
  
  def edit
    
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = '更新されました'
      redirect_to root_url
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
    
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = '削除されました'
    redirect_to tasks_url
  end
  
  private
  
  #strong parameter
  def task_params
    params.require(:task).permit(:content,:status)
  end
  
  def set_message
    @task = current_user.tasks.find(params[:id])
  end
end
