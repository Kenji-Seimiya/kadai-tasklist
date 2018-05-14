class TasklistsController < ApplicationController
  
  def index
    @tasklists = Tasklist.all
  end
  
  def show
    @tasklist = Tasklist.find(params[:id])
  end
  
  def new
    @tasklist = Tasklist.new
  end
  
  def create
    @tasklist = Tasklist.new(tasklist_params)
    
    if @tasklist.save
      flash[:success] = '登録されました'
      redirect_to @tasklist
    else
      flash.now[:danger] = '登録されませんでした'
      render :new
    end
  end
  
  def edit
    @tasklist = Tasklist.find(params[:id])
    
  end
  
  def update
    @tasklist = Tasklist.find(params[:id])
    
    if @tasklist.update(tasklist_params)
      flash[:success] = '更新されました'
      redirect_to @tasklist
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
    
  end
  
  def destroy
    @tasklist = Tasklist.find(params[:id])
    @tasklist.destroy
    
    flash[:success] = '削除されました'
    redirect_to tasklists_url
  end
  
  private
  
  #strong parameter
  def tasklist_params
    params.require(:tasklist).permit(:content,:status)
  end
end
