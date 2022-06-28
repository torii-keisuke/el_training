class LabelsController < ApplicationController

  def index
    @task = Task.find(params[:task_id])
    @labels = current_user.labels
  end

  def new
    @label = Label.new(user_id: current_user.id)
    @task = Task.find(params[:task_id])
    @labels = current_user.labels
  end

  def create
    @task = Task.find(params[:task_id])
    @labels = @task.labels
    @label = Label.new(label_params)
    if @label.save
      redirect_to edit_task_path(@task.id)
    else
      flash.now[:alert] = "名前は書いてください。"
      render action: :new
    end
  end

  def destroy
    label = Label.find(params[:id])
    task = Task.find(params[:task_id])
    label.destroy
    redirect_to new_task_label_path(task.id)
  end

  private

  def label_params
    params.require(:label).permit(:name).merge(user_id: current_user.id)
  end
end
