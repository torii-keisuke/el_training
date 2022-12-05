class LabelsController < ApplicationController
  def new
    @task = Task.find(params[:task_id])
    @label = Label.new(user_id: current_user.id)
    @labels = current_user.labels
  end

  def create
    @task = Task.find(params[:task_id])
    @labels = current_user.labels
    @label = Label.new(label_params)
    if @label.save
      redirect_to new_user_task_label_path(current_user.id, @task.id)
    else
      flash[:alert] = '名前は書いてください。'
      redirect_to new_user_task_label_path(current_user.id, @task.id)
    end
  end

  def destroy
    task = Task.find(params[:task_id])
    label = Label.find(params[:id])
    label.destroy
    redirect_to new_user_task_label_path(current_user.id, task.id)
  end

  private

  def label_params
    params.require(:label).permit(:name).merge(user_id: current_user.id)
  end
end
