class LabelsController < ApplicationController
  before_action :authenticate_user!

  def new
    @label = Label.new(user_id: current_user.id)
    @labels = current_user.labels
  end

  def create
    @labels = current_user.labels
    @label = Label.new(label_params)
    if @label.save
      redirect_to user_labels_path(current_user.id)
    else
      flash.now[:alert] = "名前は書いてください。"
      render action: :new
    end
  end

  def destroy
    label = Label.find(params[:id])
    label.destroy
    redirect_to new_user_label_path(current_user.id)
  end

  private

  def label_params
    params.require(:label).permit(:name).merge(user_id: current_user.id)
  end
end
