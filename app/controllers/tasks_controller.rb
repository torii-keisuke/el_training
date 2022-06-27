class TasksController < ApplicationController

  def index
    @tasks = Task.where(user_id: current_user.id)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to root_path
    else
      render action: :show
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :content).merge(user_id: current_user.id)
  end
end