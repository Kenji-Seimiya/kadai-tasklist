class TasksController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
  end
  
  def show
    
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = '登録されました'
      redirect_to @task
    else
      flash.now[:danger] = '登録されませんでした'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = '更新されました'
      redirect_to @task
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
    @task = Task.find(params[:id])
  end
end