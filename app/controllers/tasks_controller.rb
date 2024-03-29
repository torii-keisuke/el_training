class TasksController < ApplicationController
  def index
    @tasks = if sort_params.present?
               Task.where(user_id: current_user.id).sort_tasks(sort_params).page(params[:page]).per(10)
             else
               Task.where(user_id: current_user.id).page(params[:page]).per(10)
             end
    @statuses = Task.statuses
    @labels = current_user.labels
    @q = @tasks.ransack(params[:q])
    @result_tasks = @q.result
    @sort_list = Task.sort_list
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
    @task = Task.find(params[:id])
    @labels = current_user.labels
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to root_path
    else
      render action: :edit
    end
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
    params.require(:task).permit(:title, :content, :status, :priority, { label_ids: [] }, :start_date,
                                 :end_date).merge(user_id: current_user.id)
  end

  def sort_params
    params.permit(:sort)
  end
end
