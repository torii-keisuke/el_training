class LabelsController < ApplicationController

  def new
    @label = Label.new
    @task = Task.find(params[:task_id])
    @labels = @task.labels
  end

  def create
    @task = Task.find(params[:task_id])
    @label = @task.labels.build(label_params)
    if @task.save
      redirect_to edit_task_path(@task.id)
    else
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
    params.require(:label).permit(:name)
  end
end
