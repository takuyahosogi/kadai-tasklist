class TasklistsController < ApplicationController
  before_action :require_user_logged_in
  before_action :current_user, only: [:show, :edit, :update, :destroy]
  
  private

  def task_params
    params.require(:task).permit(:content)
  end
  
  def current_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end
